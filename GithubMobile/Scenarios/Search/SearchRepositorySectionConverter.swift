//
//  SearchRepositorySectionController.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain

class SearchRepositorySectionConverter {
  func from(_ repositories: [SearchRepositoryResult.Repository]) -> [SearchSectionModel] {
    return repositories.map(from)
  }
}

private extension SearchRepositorySectionConverter {
  func from(_ repository: SearchRepositoryResult.Repository) -> SearchSectionModel {
    return .init(id: repository.id.rawValue, name: repository.fullName, stars: repository.stars, description: repository.description ?? "-")
  }
}
