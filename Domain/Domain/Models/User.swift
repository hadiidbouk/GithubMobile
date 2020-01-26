//
//  User.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public struct User: Identifiable {
  public typealias Identifier = IdentifierOf<User>
  public typealias RawIdentifier = Int

  public let id: Identifier
  public let username: String
  public let nodeId: String
  public let avatarUrl: String
  public let gravatarId: String
  public let url: String
  public let htmlUrl: String
  public let followersUrl: String
  public let followingUrl: String
  public let gistsUrl: String
  public let starredUrl: String
  public let subscriptionsUrl: String
  public let organizationsUrl: String
  public let reposUrl: String
  public let eventsUrl: String
  public let receivedEventsUrl: String
  public let type: String
  public let siteAdmin: Bool
  public let name: String
  public let company: String
  public let blog: String
  public let location: String
  public let email: String
  public let hireable: Bool
  public let bio: String
  public let publicRepos: Int
  public let publicGists: Int
  public let totalPrivateRepos: Int
  public let ownedPrivateRepos: Int
  public let diskUsage: Int
  public let collaborators: Int
  public let twoFactorAuthentication: Bool
  public let plan: Plan
}

public extension User {
  struct Plan {
    public let name: String
    public let space: Int
    public let privateRepos: Int
    public let collaborators: Int
  }
}
