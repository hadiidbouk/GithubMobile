//
//  SearchResult.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public struct SearchRepositoryResult {
  public let totalCount: Int
  public let items: [Repository]

  public init(totalCount: Int, items: [Repository]) {
    self.totalCount = totalCount
    self.items = items
  }
}

public extension SearchRepositoryResult {
  struct Repository: Identifiable {
    public typealias Identifier = IdentifierOf<User>
    public typealias RawIdentifier = Int

    public let id: Identifier
    public let fullName: String
    public let stars: Int
    public let description: String

    init(id: Identifier, fullName: String, stars: Int, description: String) {
      self.id = id
      self.fullName = fullName
      self.stars = stars
      self.description = description
    }
  }
}
