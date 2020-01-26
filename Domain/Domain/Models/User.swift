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


  public init(id: Identifier,
              username: String,
              nodeId: String,
              avatarUrl: String,
              gravatarId: String,
              url: String,
              htmlUrl: String,
              followersUrl: String,
              followingUrl: String,
              gistsUrl: String,
              starredUrl: String,
              subscriptionsUrl: String,
              organizationsUrl: String,
              reposUrl: String,
              eventsUrl: String,
              receivedEventsUrl: String,
              type: String,
              siteAdmin: Bool,
              name: String,
              company: String,
              blog: String,
              location: String,
              email: String,
              hireable: Bool,
              bio: String,
              publicRepos: Int,
              publicGists: Int,
              totalPrivateRepos: Int,
              ownedPrivateRepos: Int,
              diskUsage: Int,
              collaborators: Int,
              twoFactorAuthentication: Bool,
              plan: Plan) {
    self.id = id
    self.username = username
    self.nodeId = nodeId
    self.avatarUrl = avatarUrl
    self.gravatarId = gravatarId
    self.url = url
    self.htmlUrl = htmlUrl
    self.followersUrl = followersUrl
    self.followingUrl = followingUrl
    self.gistsUrl = gistsUrl
    self.starredUrl = starredUrl
    self.subscriptionsUrl = subscriptionsUrl
    self.organizationsUrl = organizationsUrl
    self.reposUrl = reposUrl
    self.eventsUrl = eventsUrl
    self.receivedEventsUrl = receivedEventsUrl
    self.type = type
    self.siteAdmin = siteAdmin
    self.name = name
    self.company = company
    self.blog = blog
    self.location = location
    self.email = email
    self.hireable = hireable
    self.bio = bio
    self.publicRepos = publicRepos
    self.publicGists = publicGists
    self.totalPrivateRepos = totalPrivateRepos
    self.ownedPrivateRepos = ownedPrivateRepos
    self.diskUsage = diskUsage
    self.collaborators = collaborators
    self.twoFactorAuthentication = twoFactorAuthentication
    self.plan = plan
  }
}

public extension User {
  struct Plan {
    public let name: String
    public let space: Int
    public let privateRepos: Int
    public let collaborators: Int

    public init(name: String, space: Int, privateRepos: Int, collaborators: Int) {
      self.name = name
      self.space = space
      self.privateRepos = privateRepos
      self.collaborators = collaborators
    }
  }
}
