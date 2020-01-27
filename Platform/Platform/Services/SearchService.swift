//
//  SearchService.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Moya

enum SearchService {
  case searchRepository(query: String, page: Int, token: String)
}

extension SearchService: TargetType {

  var baseURL: URL { return apiBaseURL }

  var path: String {
    switch self {
    case .searchRepository: return "/search/repositories"
    }
  }

  var method: Method {
    switch self {
    case .searchRepository: return .get
    }
  }

  var task: Task {
    switch self {
    case .searchRepository(let query, let page, _):
      var parameters: [String: Any] = [:]
      parameters["page"] = page
      parameters["q"] = query
      return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
  }

  var headers: [String : String]? {
    switch self {
    case .searchRepository(_, _, let token): return requestHeaders(token: token)
    }
  }

  var sampleData: Data {
    switch self {
    case .searchRepository: return sampleData(from: SearchRepositoryResultResponse.sample)
    }
  }
}
