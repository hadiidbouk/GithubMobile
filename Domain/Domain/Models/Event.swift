//
//  Event.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public struct Event: Identifiable {
  public typealias Identifier = IdentifierOf<Event>
  public typealias RawIdentifier = String

  public let id: Identifier
  public let type: EventType
  public let actor: Actor
  public let repo: Repositroy
  public let createdAt: Date

  public init(id: Identifier,
              type: EventType,
              actor: Actor,
              repo: Repositroy,
              createdAt: Date) {
    self.id = id
    self.type = type
    self.actor = actor
    self.repo = repo
    self.createdAt = createdAt
  }
}

public extension Event {
  struct Actor: Identifiable {
    public typealias Identifier = IdentifierOf<Actor>
    public typealias RawIdentifier = Int

    public let id: Identifier
    public let username: String
    public let displayName: String
    public let url: String
    public let avatarUrl: String

    public init(id: Identifier,
                username: String,
                displayName: String,
                url: String,
                avatarUrl: String) {
      self.id = id
      self.username = username
      self.displayName = displayName
      self.url = url
      self.avatarUrl = avatarUrl
    }
  }

  struct Repositroy: Identifiable {
    public typealias Identifier = IdentifierOf<Repositroy>
    public typealias RawIdentifier = Int

    public let id: Identifier
    public let name: String
    public let url: String

    public init(id: Identifier,
                name: String,
                url: String) {
      self.id = id
      self.name = name
      self.url = url
    }
  }

  enum EventType {
    case checkRun
    case checkSuite
    case commitComment
    case contentReference
    case create
    case delete
    case deployKey
    case deployment
    case deploymentStatus
    case download
    case follow
    case fork
    case forkApply
    case gitHubAppAuthorization
    case gist
    case gollum
    case installation
    case installationRepositories
    case issueComment
    case issues
    case label
    case marketplacePurchase
    case member
    case membership
    case meta
    case milestone
    case organization
    case orgBlock
    case package
    case pageBuild
    case projectCard
    case projectColumn
    case project
    case `public`
    case pullRequest
    case pullRequestReview
    case pullRequestReviewComment
    case push
    case release
    case repositoryDispatch
    case repository
    case repositoryImport
    case repositoryVulnerabilityAlert
    case securityAdvisory
    case sponsorship
    case star
    case status
    case team
    case teamAdd
    case watch
  }
}
