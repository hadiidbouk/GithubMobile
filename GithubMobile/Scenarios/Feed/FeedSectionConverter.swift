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
    case .watch:
      let repository = from(event.repo)
      return FeedSectionModel.Action.star(repository: repository).description
    case .create:
      let repository = from(event.repo)
      return FeedSectionModel.Action.create(repository: repository).description
    case .public:
      let repository = from(event.repo)
      return FeedSectionModel.Action.makePublic(repository: repository).description
    case .fork:
      guard let forkee = event.payload.forkee else {
        preconditionFailure("forkee shouldn't be nil")
      }
      let fromRepositoryId = Event.Repositroy.Identifier(rawValue: forkee.id.rawValue)
      let fromRepository = from(Event.Repositroy(id: fromRepositoryId, name: forkee.fullName, url: forkee.url))
      let toRepository = from(event.repo)
      return FeedSectionModel.Action.fork(fromRepository: fromRepository, toRepository: toRepository).description
    default:
      return FeedSectionModel.Action.notSupported.description
    }
  }
  func from(_ repo: Event.Repositroy) -> FeedSectionModel.Repository {
    return .init(name: repo.name, url: repo.url)
  }
}

private extension FeedSectionModel.Action {
  var description: NSMutableAttributedString {
    switch self {
    case .star(let repository):           return attributedText(normalText: "Starred", boldText: repository.name)
    case .create(let repository):         return attributedText(normalText: "Created", boldText: repository.name)
    case .makePublic(let repository):     return attributedText(normalText: "Created", boldText: repository.name, postfix: "public")
    case .fork(let fromRepo, let toRepo): return forkedAttributedText(fromRepoName: fromRepo.name, toRepoName: toRepo.name)
    case .notSupported:                   return attributedText(normalText: "", boldText: "Not Supported")
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

  private func forkedAttributedText(fromRepoName: String, toRepoName: String) -> NSMutableAttributedString {
    let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
    let finalString = NSMutableAttributedString(string: "Forked from ")

    let fromRepoString = NSMutableAttributedString(string: fromRepoName, attributes: attrs)
    finalString.append(fromRepoString)

    let to = NSMutableAttributedString(string: " to ")
    finalString.append(to)

    let toRepoString = NSMutableAttributedString(string: fromRepoName, attributes: attrs)
    finalString.append(toRepoString)

    return finalString
  }
}
