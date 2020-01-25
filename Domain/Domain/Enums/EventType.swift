//
//  EventType.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public enum EventType {
  case CheckRunEvent
  case CheckSuiteEvent
  case CommitCommentEvent
  case ContentReferenceEvent
  case CreateEvent
  case DeleteEvent
  case DeployKeyEvent
  case DeploymentEvent
  case DeploymentStatusEvent
  case DownloadEvent
  case FollowEvent
  case ForkEvent
  case ForkApplyEvent
  case GitHubAppAuthorizationEvent
  case GistEvent
  case GollumEvent
  case InstallationEvent
  case InstallationRepositoriesEvent
  case IssueCommentEvent
  case IssuesEvent
  case LabelEvent
  case MarketplacePurchaseEvent
  case MemberEvent
  case MembershipEvent
  case MetaEvent
  case MilestoneEvent
  case OrganizationEvent
  case OrgBlockEvent
  case PackageEvent
  case PageBuildEvent
  case ProjectCardEvent
  case ProjectColumnEvent
  case ProjectEvent
  case PublicEvent
  case PullRequestEvent
  case PullRequestReviewEvent
  case PullRequestReviewCommentEvent
  case PushEvent
  case ReleaseEvent
  case RepositoryDispatchEvent
  case RepositoryEvent
  case RepositoryImportEvent
  case RepositoryVulnerabilityAlertEvent
  case SecurityAdvisoryEvent
  case SponsorshipEvent
  case StarEvent
  case StatusEvent
  case TeamEvent
  case TeamAddEvent
  case WatchEvent
}
