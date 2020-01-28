//
//  UserResponse.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation
import Domain

struct UserResponse: Decodable {
  let id: User.Identifier
  let login: String
  let nodeId: String
  let avatarUrl: String
  let gravatarId: String
  let url: String
  let htmlUrl: String
  let followersUrl: String
  let followingUrl: String
  let gistsUrl: String
  let starredUrl: String
  let subscriptionsUrl: String
  let organizationsUrl: String
  let reposUrl: String
  let eventsUrl: String
  let receivedEventsUrl: String
  let type: String
  let siteAdmin: Bool
  let name: String
  let company: String?
  let blog: String
  let location: String
  let email: String
  let hireable: Bool
  let bio: String
  let publicRepos: Int
  let publicGists: Int
  let followers: Int
  let following: Int
  let createdAt: Date
  let updatedAt: Date
  let privateGists: Int
  let totalPrivateRepos: Int
  let ownedPrivateRepos: Int
  let diskUsage: Int
  let collaborators: Int
  let twoFactorAuthentication: Bool
  let plan: Plan
}

extension UserResponse {
  struct Plan: Decodable {
    let name: String
    let space: Int
    let collaborators: Int
    let privateRepos: Int

    private enum CodingKeys: String, CodingKey {
      case name, space, collaborators
      case privateRepos = "private_repos"
    }

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.name = try container.decode(String.self, forKey: .name)
      self.space = try container.decode(Int.self, forKey: .space)
      self.collaborators = try container.decode(Int.self, forKey: .collaborators)
      self.privateRepos = try container.decode(Int.self, forKey: .privateRepos)
    }
  }
}

extension UserResponse {
  private enum CodingKeys: String, CodingKey {
    case id
    case login
    case nodeId = "node_id"
    case avatarUrl = "avatar_url"
    case gravatarId = "gravatar_id"
    case url
    case htmlUrl = "html_url"
    case followersUrl = "followers_url"
    case followingUrl = "following_url"
    case gistsUrl = "gists_url"
    case starredUrl = "starred_url"
    case subscriptionsUrl = "subscriptions_url"
    case organizationsUrl = "organizations_url"
    case reposUrl = "repos_url"
    case eventsUrl = "events_url"
    case receivedEventsUrl = "received_events_url"
    case type
    case siteAdmin = "site_admin"
    case name
    case company
    case blog
    case location
    case email
    case hireable
    case bio
    case publicRepos = "public_repos"
    case publicGists = "public_gists"
    case followers
    case following
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case privateGists = "private_gists"
    case totalPrivateRepos = "total_private_repos"
    case ownedPrivateRepos = "owned_private_repos"
    case diskUsage = "disk_usage"
    case collaborators
    case twoFactorAuthentication = "two_factor_authentication"
    case plan
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(User.Identifier.self, forKey: .id)
    self.login = try container.decode(String.self, forKey: .login)
    self.nodeId = try container.decode(String.self, forKey: .nodeId)
    self.avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
    self.gravatarId = try container.decode(String.self, forKey: .gravatarId)
    self.url = try container.decode(String.self, forKey: .url)
    self.htmlUrl = try container.decode(String.self, forKey: .htmlUrl)
    self.followersUrl = try container.decode(String.self, forKey: .followersUrl)
    self.followingUrl = try container.decode(String.self, forKey: .followingUrl)
    self.gistsUrl = try container.decode(String.self, forKey: .gistsUrl)
    self.starredUrl = try container.decode(String.self, forKey: .starredUrl)
    self.subscriptionsUrl = try container.decode(String.self, forKey: .subscriptionsUrl)
    self.organizationsUrl = try container.decode(String.self, forKey: .organizationsUrl)
    self.reposUrl = try container.decode(String.self, forKey: .reposUrl)
    self.eventsUrl = try container.decode(String.self, forKey: .eventsUrl)
    self.receivedEventsUrl = try container.decode(String.self, forKey: .receivedEventsUrl)
    self.type = try container.decode(String.self, forKey: .type)
    self.siteAdmin = try container.decode(Bool.self, forKey: .siteAdmin)
    self.name = try container.decode(String.self, forKey: .name)
    self.company = try container.decode(String?.self, forKey: .company)
    self.blog = try container.decode(String.self, forKey: .blog)
    self.location = try container.decode(String.self, forKey: .location)
    self.email = try container.decode(String.self, forKey: .email)
    self.hireable = try container.decode(Bool.self, forKey: .hireable)
    self.bio = try container.decode(String.self, forKey: .bio)
    self.publicRepos = try container.decode(Int.self, forKey: .publicRepos)
    self.publicGists = try container.decode(Int.self, forKey: .publicGists)
    self.followers = try container.decode(Int.self, forKey: .followers)
    self.following = try container.decode(Int.self, forKey: .following)
    self.createdAt = try container.decode(Date.self, forKey: .createdAt)
    self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
    self.privateGists = try container.decode(Int.self, forKey: .privateGists)
    self.totalPrivateRepos = try container.decode(Int.self, forKey: .totalPrivateRepos)
    self.ownedPrivateRepos = try container.decode(Int.self, forKey: .ownedPrivateRepos)
    self.diskUsage = try container.decode(Int.self, forKey: .diskUsage)
    self.collaborators = try container.decode(Int.self, forKey: .collaborators)
    self.twoFactorAuthentication = try container.decode(Bool.self, forKey: .twoFactorAuthentication)
    self.plan = try container.decode(Plan.self, forKey: .plan)
  }
}

extension UserResponse {
  static let sample: [String: Any?] = [
      "login": "hadiidbouk",
      "id": 19314956,
      "node_id": "MDQ6VXNlcjE5MzE0OTU2",
      "avatar_url": "https://avatars0.githubusercontent.com/u/19314956?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/hadiidbouk",
      "html_url": "https://github.com/hadiidbouk",
      "followers_url": "https://api.github.com/users/hadiidbouk/followers",
      "following_url": "https://api.github.com/users/hadiidbouk/following{/other_user}",
      "gists_url": "https://api.github.com/users/hadiidbouk/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/hadiidbouk/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/hadiidbouk/subscriptions",
      "organizations_url": "https://api.github.com/users/hadiidbouk/orgs",
      "repos_url": "https://api.github.com/users/hadiidbouk/repos",
      "events_url": "https://api.github.com/users/hadiidbouk/events{/privacy}",
      "received_events_url": "https://api.github.com/users/hadiidbouk/received_events",
      "type": "User",
      "site_admin": false,
      "name": "Hadi Dbouk",
      "company": nil,
      "blog": "",
      "location": "Lebanon",
      "email": "hadiidbouk@gmail.com",
      "hireable": true,
      "bio": "Mobile and Backend Developer",
      "public_repos": 48,
      "public_gists": 2,
      "followers": 37,
      "following": 121,
      "created_at": "2016-05-11T21:35:04Z",
      "updated_at": "2020-01-26T11:06:53Z",
      "private_gists": 0,
      "total_private_repos": 19,
      "owned_private_repos": 19,
      "disk_usage": 437578,
      "collaborators": 5,
      "two_factor_authentication": false,
      "plan": [
          "name": "free",
          "space": 976562499,
          "collaborators": 0,
          "private_repos": 10000
      ]
  ]
}
