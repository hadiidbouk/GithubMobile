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
  let action: FeedAction

  init(id: String, actorName: String, avatarUrl: String, action: FeedAction) {
    self.id = id
    self.actorName = actorName
    self.avatarUrl = avatarUrl
    self.action = action
  }
}

struct FeedRepository: Equatable {
  let id: String
  let name: String
  let url: String
}

enum FeedAction: Equatable {
  case star(repository: FeedRepository)
  case fork
  case create(repositories: FeedRepository)
  case makePublic(repository: FeedRepository)

  static func == (lhs: FeedAction, rhs: FeedAction) -> Bool {
        switch (lhs, rhs) {
        case let (.star(lhsRepository), .star(rhsRepository)):              return lhsRepository == rhsRepository
        case let (.create(lhsRepository), .create(rhsRepository)):          return lhsRepository == rhsRepository
        case let (.makePublic(lhsRepository), .makePublic(rhsRepository)):  return lhsRepository == rhsRepository
        case (.fork, .fork):  return true
        case (.star, _),
             (.fork, _),
             (.create, _),
             (.makePublic, _):                              return false
    }
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
           action == other.action
  }
}


