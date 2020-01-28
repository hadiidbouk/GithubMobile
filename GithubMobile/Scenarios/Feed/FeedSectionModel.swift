//
//  Feed.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import IGListKit

class FeedSectionModel {
  let id: String
  let actorName: String
  let avatarUrl: String
  let description: NSAttributedString
  let createdAt: Date

  init(id: String, actorName: String, avatarUrl: String, description: NSAttributedString, createdAt: Date) {
    self.id = id
    self.actorName = actorName
    self.avatarUrl = avatarUrl
    self.description = description
    self.createdAt = createdAt
  }
}

extension FeedSectionModel {
  struct Repository: Equatable {
    let name: String
    let url: String
  }

  enum Action: Equatable {
    case star(repository: Repository)
    case fork(fromRepository: Repository, toRepository: Repository)
    case create(repository: Repository)
    case makePublic(repository: Repository)
    case notSupported

    static func == (lhs: Action, rhs: Action) -> Bool {
          switch (lhs, rhs) {
          case let (.star(lhsRepository), .star(rhsRepository)):                    return lhsRepository == rhsRepository
          case let (.create(lhsRepository), .create(rhsRepository)):                return lhsRepository == rhsRepository
          case let (.makePublic(lhsRepository), .makePublic(rhsRepository)):        return lhsRepository == rhsRepository
          case let (.fork(lhsFromRepo, lhsToRepo), .fork(rhsFromRepo, rhsToRepo)):  return (lhsFromRepo == rhsFromRepo) && (lhsToRepo == rhsToRepo)
          case (.notSupported, .notSupported):                                      return true
          case (.star, _),
               (.fork, _),
               (.create, _),
               (.makePublic, _),
               (.notSupported, _):                                                   return false
      }
    }
  }
}

extension FeedSectionModel: Hashable {

  func hash(into hasher: inout Hasher) {

  }

  static func == (lhs: FeedSectionModel, rhs: FeedSectionModel) -> Bool {
    return lhs.id == rhs.id &&
           lhs.actorName == rhs.actorName &&
           lhs.avatarUrl == rhs.avatarUrl &&
           lhs.description == rhs.description &&
           lhs.createdAt == rhs.createdAt
  }
}

extension FeedSectionModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return id as NSString
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else {
      return true
    }

    guard let other = object as? FeedSectionModel else {
      return false
    }

    return id == other.id &&
           actorName == other.actorName &&
           avatarUrl == other.avatarUrl &&
           description == other.description &&
           createdAt == other.createdAt
  }
}


