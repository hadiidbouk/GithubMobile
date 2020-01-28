//
//  ReposService.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/28/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Moya

enum ReposService {
  case getRepository(token: String, repositoryFullName: String)
}

extension ReposService: TargetType {

  var baseURL: URL { return apiBaseURL }

  var path: String {
    switch self {
    case .getRepository(_, let repositoryFullName): return "/repos/\(repositoryFullName)"
    }
  }

  var method: Method {
    switch self {
    case .getRepository: return .get
    }
  }

  var task: Task {
    switch self {
    case .getRepository: return .requestPlain
    }
  }

  var headers: [String : String]? {
    switch self {
    case .getRepository(let token, _): return requestHeaders(token: token)
    }
  }

  var sampleData: Data {
    switch self {
    case .getRepository: return sampleData(from: RepositoryResponse.sample)
    }
  }
}
