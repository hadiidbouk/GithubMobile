//
//  EventResponseModel.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain

struct EventResponse: Decodable {
  let id: Event.Identifier
  let type: EventType
  let actor: Actor
  let repo: Repository
  let createdAt: Date

  //todo: add playload

  private enum CodingKeys: String, CodingKey {
    case id
    case type
    case actor
    case repo
    case createdAt = "created_at"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let id = try container.decode(Event.Identifier.self, forKey: .id)
    let type = try container.decode(EventType.self, forKey: .type)
    let actor = try container.decode(Actor.self, forKey: .actor)
    let repo = try container.decode(Repository.self, forKey: .repo)
    let createdAt = try container.decode(Date.self, forKey: .createdAt)

    self.init(id: id, type: type, actor: actor, repo: repo, createdAt: createdAt)
  }
}

extension EventResponse {
  struct Actor: Decodable {
    let id: Domain.Actor.Identifier
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
      let id = try container.decode(Actor.Identifier.self, forKey: .id)
      let login = try container.decode(String.self, forKey: .login)
      let displayLogin = try container.decode(String.self, forKey: .displayLogin)
      let gravatarId = try container.decode(String.self, forKey: .gravatarId)
      let url = try container.decode(String.self, forKey: .url)
      let avatarUrl = try container.decode(String.self, forKey: .avatarUrl)

      self.init(id: id, login: login, displayLogin: displayLogin, gravatarId: gravatarId, url: url, avatarUrl: avatarUrl)
    }
  }

  struct Repository: Decodable {
    let id: EventRepositroy.Identifier
    let name: String
    let url: String
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
