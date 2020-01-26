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
}

extension UserService: TargetType {

  var baseURL: URL { return apiBaseURL }
  
  var path: String {
    switch self {
    case .getAuthenticatedUser: return "/user"
    }
  }
  
  var method: Method {
    switch self {
    case .getAuthenticatedUser: return .get
    }
  }
  
  var task: Task {
    switch self {
    case .getAuthenticatedUser: return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .getAuthenticatedUser(let token): return requestHeaders(token: token)
    }
  }
  
  var sampleData: Data {
    switch self {
    case .getAuthenticatedUser: return sampleData(from: UserResponse.sample)
    }
  }
}
