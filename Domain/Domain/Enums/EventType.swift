//
//  EventType.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public enum EventType {
  case CheckRun
  case CheckSuite
  case CommitComment
  case ContentReference
  case Create
  case Delete
  case DeployKey
  case Deployment
  case DeploymentStatus
  case Download
  case Follow
  case Fork
  case ForkApply
  case GitHubAppAuthorization
  case Gist
  case Gollum
  case Installation
  case InstallationRepositories
  case IssueComment
  case Issues
  case Label
  case MarketplacePurchase
  case Member
  case Membership
  case Meta
  case Milestone
  case Organization
  case OrgBlock
  case Package
  case PageBuild
  case ProjectCard
  case ProjectColumn
  case Project
  case Public
  case PullRequest
  case PullRequestReview
  case PullRequestReviewComment
  case Push
  case Release
  case RepositoryDispatch
  case Repository
  case RepositoryImport
  case RepositoryVulnerabilityAlert
  case SecurityAdvisory
  case Sponsorship
  case Star
  case Status
  case Team
  case TeamAdd
  case Watch
}
