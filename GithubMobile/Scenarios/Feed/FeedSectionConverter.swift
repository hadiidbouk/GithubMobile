//
//  FeedSectionConverter.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import Domain

class FeedSectionConverter {
  func from(_ event: Event) -> FeedSectionModel {
    return .init(id: event.id.rawValue,
                 actorName: event.actor.displayName,
                 avatarUrl: event.actor.avatarUrl,
                 description: from(event),
                 createdAt: event.createdAt)
  }
}

private extension FeedSectionConverter {
  func from(_ event: Event) -> NSMutableAttributedString {
    switch event.type {
    case .watch:  return FeedSectionModel.Action.star(repository: from(event.repo)).description
    case .create: return FeedSectionModel.Action.create(repository: from(event.repo)).description
    case .public: return FeedSectionModel.Action.makePublic(repository: from(event.repo)).description
    case .fork:   return FeedSectionModel.Action.fork.description
    default:      return FeedSectionModel.Action.fork.description
    }
  }
  func from(_ repo: Event.Repositroy) -> FeedSectionModel.Repository {
    return .init(name: repo.name, url: repo.url)
  }
}

private extension FeedSectionModel.Action {
  var description: NSMutableAttributedString {
    switch self {
    case .star(let repository):       return attributedText(normalText: "Starred", boldText: repository.name)
    case .fork:                       return attributedText(normalText: "Forked", boldText: "")
    case .create(let repository):     return attributedText(normalText: "Created", boldText: repository.name)
    case .makePublic(let repository): return attributedText(normalText: "Created", boldText: repository.name, postfix: "public")
    }
  }

  private func attributedText(normalText: String, boldText: String, postfix: String = "") -> NSMutableAttributedString {
    let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
    let attributedString = NSMutableAttributedString(string: boldText, attributes: attrs)
    let finalString = NSMutableAttributedString(string: "\(normalText) ")
    finalString.append(attributedString)
    if postfix != "" {
      let attributedPostfix = NSMutableAttributedString(string: " \(postfix)")
      finalString.append(attributedPostfix)
    }
    return finalString
  }
}
