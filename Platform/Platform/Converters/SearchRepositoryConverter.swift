//
//  SearchRepositoryConverter.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain

class SearchRepositoryConverter {
  func from(_ response: SearchRepositoryResultResponse) -> SearchRepositoryResult {
    return .init(totalCount: response.totalCount, items: response.items.map(from))
  }
}

private extension SearchRepositoryConverter {
  func from(_ response: SearchRepositoryResultResponse.Repository) -> SearchRepositoryResult.Repository {
    return SearchRepositoryResult.Repository(id: response.id,
                                             fullName: response.fullName,
                                             stars: response.stars,
                                             description: response.description)
  }
}
