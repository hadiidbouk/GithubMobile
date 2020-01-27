//
//  UserService.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Moya

enum UserService {
  case getAuthenticatedUser(token: String)
  case getReceivedEvents(token: String, username: String, page: Int)
}

extension UserService: TargetType {

  var baseURL: URL { return apiBaseURL }
  
  var path: String {
    switch self {
    case .getAuthenticatedUser:                         return "/user"
    case .getReceivedEvents(_, let username, _): return "/users/\(username)/received_events"
    }
  }
  
  var method: Method {
    switch self {
    case .getAuthenticatedUser,
         .getReceivedEvents: return .get
    }
  }
  
  var task: Task {
    switch self {
    case .getAuthenticatedUser:                 return .requestPlain
    case .getReceivedEvents(_, _, let page):    return .requestParameters(parameters: ["page": page], encoding: URLEncoding.default)
    }
  }

  var headers: [String : String]? {
    switch self {
    case .getAuthenticatedUser(let token),
         .getReceivedEvents(let token, _, _): return requestHeaders(token: token)
    }
  }
  
  var sampleData: Data {
    switch self {
    case .getAuthenticatedUser: return sampleData(from: UserResponse.sample)
    case .getReceivedEvents:    return sampleData(from: EventResponse.sample)
    }
  }
}
