//
//  EventResponseModel.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation
import Domain

struct EventResponse: Decodable {
  let id: Event.Identifier
  let type: EventType
  let actor: Actor
  let repo: Repository
  let payload: Payload
  let createdAt: Date

  private enum CodingKeys: String, CodingKey {
    case id
    case type
    case actor
    case repo
    case payload
    case createdAt = "created_at"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(Event.Identifier.self, forKey: .id)
    self.type = try container.decode(EventType.self, forKey: .type)
    self.actor = try container.decode(Actor.self, forKey: .actor)
    self.repo = try container.decode(Repository.self, forKey: .repo)
    self.payload = try container.decode(Payload.self, forKey: .payload)
    self.createdAt = try container.decode(Date.self, forKey: .createdAt)
  }
}

extension EventResponse {
  struct Actor: Decodable {
    let id: Event.Actor.Identifier
    let login: String
    let displayLogin: String
    let gravatarId: String
    let url: String
    let avatarUrl: String

    private enum CodingKeys: String, CodingKey {
      case id
      case login
      case displayLogin = "display_login"
      case gravatarId = "gravatar_id"
      case url
      case avatarUrl = "avatar_url"
    }

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try container.decode(Event.Actor.Identifier.self, forKey: .id)
      self.login = try container.decode(String.self, forKey: .login)
      self.displayLogin = try container.decode(String.self, forKey: .displayLogin)
      self.gravatarId = try container.decode(String.self, forKey: .gravatarId)
      self.url = try container.decode(String.self, forKey: .url)
      self.avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
    }
  }

  struct Repository: Decodable {
    let id: Event.Repositroy.Identifier
    let name: String
    let url: String
  }

  struct Payload: Decodable {
    public let forkee: Forkee?
  }

  struct Forkee: Decodable {
    public let id: Event.Forkee.Identifier
    public let fullName: String
    public let url: String

    private enum CodingKeys: String, CodingKey {
      case id
      case fullName = "full_name"
      case url
    }

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try container.decode(Event.Forkee.Identifier.self, forKey: .id)
      self.fullName = try container.decode(String.self, forKey: .fullName)
      self.url = try container.decode(String.self, forKey: .url)
    }
  }

  enum EventType: String, Decodable {
    case checkRun = "CheckRunEvent"
    case checkSuite = "CheckSuiteEvent"
    case commitComment = "CommitCommentEvent"
    case contentReference = "ContentReferenceEvent"
    case create = "CreateEvent"
    case delete = "DeleteEvent"
    case deployKey = "DeployKeyEvent"
    case deployment = "DeploymentEvent"
    case deploymentStatus = "DeploymentStatusEvent"
    case download = "DownloadEvent"
    case follow = "FollowEvent"
    case fork = "ForkEvent"
    case forkApply = "ForkApplyEvent"
    case gitHubAppAuthorization = "GitHubAppAuthorizationEvent"
    case gist = "GistEvent"
    case gollum = "GollumEvent"
    case installation = "InstallationEvent"
    case installationRepositories = "InstallationRepositoriesEvent"
    case issueComment = "IssueCommentEvent"
    case issues = "IssuesEvent"
    case label = "LabelEvent"
    case marketplacePurchase = "MarketplacePurchaseEvent"
    case member = "MemberEvent"
    case membership = "MembershipEvent"
    case meta = "MetaEvent"
    case milestone = "MilestoneEvent"
    case organization = "OrganizationEvent"
    case orgBlock = "OrgBlockEvent"
    case package = "PackageEvent"
    case pageBuild = "PageBuildEvent"
    case projectCard = "ProjectCardEvent"
    case projectColumn = "ProjectColumnEvent"
    case project = "ProjectEvent"
    case `public` = "PublicEvent"
    case pullRequest = "PullRequestEvent"
    case pullRequestReview = "PullRequestReviewEvent"
    case pullRequestReviewComment = "PullRequestReviewCommentEvent"
    case push = "PushEvent"
    case release = "ReleaseEvent"
    case repositoryDispatch = "RepositoryDispatchEvent"
    case repository = "RepositoryEvent"
    case repositoryImport = "RepositoryImportEvent"
    case repositoryVulnerabilityAlert = "RepositoryVulnerabilityAlertEvent"
    case securityAdvisory = "SecurityAdvisoryEvent"
    case sponsorship = "SponsorshipEvent"
    case star = "StarEvent"
    case status = "StatusEvent"
    case team = "TeamEvent"
    case teamAdd = "TeamAddEvent"
    case watch = "WatchEvent"
  }
}

extension EventResponse {
  static let sample : [[String: Any]] = [
      [
          "id": "11360676860",
          "type": "WatchEvent",
          "actor": [
              "id": 4404199,
              "login": "mrahhal",
              "display_login": "mrahhal",
              "gravatar_id": "",
              "url": "https://api.github.com/users/mrahhal",
              "avatar_url": "https://avatars.githubusercontent.com/u/4404199?"
          ],
          "repo": [
              "id": 138393139,
              "name": "trimstray/the-book-of-secret-knowledge",
              "url": "https://api.github.com/repos/trimstray/the-book-of-secret-knowledge"
          ],
          "payload": [
              "action": "started"
          ],
          "public": true,
          "created_at": "2020-01-26T09:07:37Z"
      ],
      [
          "id": "11360563419",
          "type": "ForkEvent",
          "actor": [
              "id": 3879281,
              "login": "hitherejoe",
              "display_login": "hitherejoe",
              "gravatar_id": "",
              "url": "https://api.github.com/users/hitherejoe",
              "avatar_url": "https://avatars.githubusercontent.com/u/3879281?"
          ],
          "repo": [
              "id": 7431133,
              "name": "Rob--W/cors-anywhere",
              "url": "https://api.github.com/repos/Rob--W/cors-anywhere"
          ],
          "payload": [
              "forkee": [
                  "id": 236284051,
                  "node_id": "MDEwOlJlcG9zaXRvcnkyMzYyODQwNTE=",
                  "name": "cors-anywhere",
                  "full_name": "hitherejoe/cors-anywhere",
                  "private": false,
                  "owner": [
                      "login": "hitherejoe",
                      "id": 3879281,
                      "node_id": "MDQ6VXNlcjM4NzkyODE=",
                      "avatar_url": "https://avatars0.githubusercontent.com/u/3879281?v=4",
                      "gravatar_id": "",
                      "url": "https://api.github.com/users/hitherejoe",
                      "html_url": "https://github.com/hitherejoe",
                      "followers_url": "https://api.github.com/users/hitherejoe/followers",
                      "following_url": "https://api.github.com/users/hitherejoe/following{/other_user}",
                      "gists_url": "https://api.github.com/users/hitherejoe/gists{/gist_id}",
                      "starred_url": "https://api.github.com/users/hitherejoe/starred{/owner}{/repo}",
                      "subscriptions_url": "https://api.github.com/users/hitherejoe/subscriptions",
                      "organizations_url": "https://api.github.com/users/hitherejoe/orgs",
                      "repos_url": "https://api.github.com/users/hitherejoe/repos",
                      "events_url": "https://api.github.com/users/hitherejoe/events{/privacy}",
                      "received_events_url": "https://api.github.com/users/hitherejoe/received_events",
                      "type": "User",
                      "site_admin": false
                  ],
                  "html_url": "https://github.com/hitherejoe/cors-anywhere",
                  "description": "CORS Anywhere is a NodeJS reverse proxy which adds CORS headers to the proxied request.",
                  "fork": true,
                  "url": "https://api.github.com/repos/hitherejoe/cors-anywhere",
                  "forks_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/forks",
                  "keys_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/keys{/key_id}",
                  "collaborators_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/collaborators{/collaborator}",
                  "teams_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/teams",
                  "hooks_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/hooks",
                  "issue_events_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/issues/events{/number}",
                  "events_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/events",
                  "assignees_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/assignees{/user}",
                  "branches_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/branches{/branch}",
                  "tags_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/tags",
                  "blobs_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/git/blobs{/sha}",
                  "git_tags_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/git/tags{/sha}",
                  "git_refs_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/git/refs{/sha}",
                  "trees_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/git/trees{/sha}",
                  "statuses_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/statuses/{sha}",
                  "languages_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/languages",
                  "stargazers_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/stargazers",
                  "contributors_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/contributors",
                  "subscribers_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/subscribers",
                  "subscription_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/subscription",
                  "commits_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/commits{/sha}",
                  "git_commits_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/git/commits{/sha}",
                  "comments_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/comments{/number}",
                  "issue_comment_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/issues/comments{/number}",
                  "contents_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/contents/{+path}",
                  "compare_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/compare/{base}...{head}",
                  "merges_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/merges",
                  "archive_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/{archive_format}{/ref}",
                  "downloads_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/downloads",
                  "issues_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/issues{/number}",
                  "pulls_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/pulls{/number}",
                  "milestones_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/milestones{/number}",
                  "notifications_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/notifications{?since,all,participating}",
                  "labels_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/labels{/name}",
                  "releases_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/releases{/id}",
                  "deployments_url": "https://api.github.com/repos/hitherejoe/cors-anywhere/deployments",
                  "created_at": "2020-01-26T08:08:19Z",
                  "updated_at": "2020-01-25T23:03:52Z",
                  "pushed_at": "2019-08-28T13:20:50Z",
                  "git_url": "git://github.com/hitherejoe/cors-anywhere.git",
                  "ssh_url": "git@github.com:hitherejoe/cors-anywhere.git",
                  "clone_url": "https://github.com/hitherejoe/cors-anywhere.git",
                  "svn_url": "https://github.com/hitherejoe/cors-anywhere",
                  "homepage": "",
                  "size": 186,
                  "stargazers_count": 0,
                  "watchers_count": 0,
                  "language": nil,
                  "has_issues": false,
                  "has_projects": true,
                  "has_downloads": true,
                  "has_wiki": true,
                  "has_pages": false,
                  "forks_count": 0,
                  "mirror_url": nil,
                  "archived": false,
                  "disabled": false,
                  "open_issues_count": 0,
                  "license": nil,
                  "forks": 0,
                  "open_issues": 0,
                  "watchers": 0,
                  "default_branch": "master",
                  "public": true
              ]
          ],
          "public": true,
          "created_at": "2020-01-26T08:08:20Z"
      ],
      [
          "id": "11358953100",
          "type": "CreateEvent",
          "actor": [
              "id": 23558090,
              "login": "m1guelpf",
              "display_login": "m1guelpf",
              "gravatar_id": "",
              "url": "https://api.github.com/users/m1guelpf",
              "avatar_url": "https://avatars.githubusercontent.com/u/23558090?"
          ],
          "repo": [
              "id": 236208026,
              "name": "m1guelpf/byte-uploader",
              "url": "https://api.github.com/repos/m1guelpf/byte-uploader"
          ],
          "payload": [
              "ref": nil,
              "ref_type": "repository",
              "master_branch": "master",
              "description": nil,
              "pusher_type": "user"
          ],
          "public": true,
          "created_at": "2020-01-25T18:00:52Z"
      ]
  ]
}
