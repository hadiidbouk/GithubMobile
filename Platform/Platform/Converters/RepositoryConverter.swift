//
//  RepositoryConverter.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/28/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain

class RepositoryConverter {
  func from(_ response: RepositoryResponse) -> Repository {
    return .init(id: response.id,
                 fullName: response.fullName,
                 description: response.description,
                 starsCount: response.starsCount,
                 forksCount: response.forksCount,
                 issuesCount: response.issuesCount,
                 watchersCount: response.watchersCount)
  }
}
