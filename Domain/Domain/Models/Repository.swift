//
//  Repository.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/28/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public struct Repository: Identifiable {
  public typealias Identifier = IdentifierOf<User>
  public typealias RawIdentifier = Int

  public let id: Identifier
  public let name: String
  public let fullName: String
  public let description: String?
  public let starsCount: Int
  public let forksCount: Int
  public let issuesCount: Int
  public let watchersCount: Int

  public init(id: Identifier,
              name: String,
              fullName: String,
              description: String?,
              starsCount: Int,
              forksCount: Int,
              issuesCount: Int,
              watchersCount: Int) {
    self.id = id
    self.name = name
    self.fullName = fullName
    self.description = description
    self.starsCount = starsCount
    self.forksCount = forksCount
    self.issuesCount = issuesCount
    self.watchersCount = watchersCount
  }
}
