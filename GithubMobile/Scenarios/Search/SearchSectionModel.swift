//
//  RepositorySectionModel.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import IGListKit

class SearchSectionModel {
  let id: Int
  let name: String
  let stars: Int
  let description: String?

  init(id: Int,
       name: String,
       stars: Int,
       description: String?) {
    self.id = id
    self.name = name
    self.stars = stars
    self.description = description
  }
}

extension SearchSectionModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return id as NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else {
      return true
    }

    guard let other = object as? SearchSectionModel else {
      return false
    }

    return id == other.id &&
           name == other.name &&
           stars == other.stars &&
           description == other.description
  }
}
