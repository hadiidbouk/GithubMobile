//
//  EventConverter.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain

class EventConverter {
  func from(_ response: EventResponse) -> Event {
    return Event(id: response.id,
                 type: from(response.type),
                 actor: from(response.actor),
                 repo: from(response.repo),
                 payload: from(response.payload),
                 createdAt: response.createdAt)
  }
}

extension EventConverter {
  func from(_ response: EventResponse.Repository) -> Event.Repositroy {
    return .init(id: response.id, name: response.name, url: response.url)
  }

  func from(_ response: EventResponse.Actor) -> Event.Actor {
    return .init(id: response.id,
                 username: response.login,
                 displayName: response.displayLogin,
                 url: response.url,
                 avatarUrl: response.avatarUrl)
  }

  func from(_ respone: EventResponse.Payload) -> Event.Payload {
    return .init(forkee: from(respone.forkee))
  }

  func from(_ response: EventResponse.Forkee?) -> Event.Forkee? {
    guard let response = response else {
      return nil
    }
    return .init(id: response.id, fullName: response.fullName, url: response.url)
  }

  func from(_ eventType: EventResponse.EventType) -> Event.EventType {
    switch eventType {
    case .checkRun:                     return .checkRun
    case .checkSuite:                   return .checkSuite
    case .commitComment:                return .commitComment
    case .contentReference:             return .contentReference
    case .create:                       return .create
    case .delete:                       return .delete
    case .deployKey:                    return .deployKey
    case .deployment:                   return .deployment
    case .deploymentStatus:             return .deploymentStatus
    case .download:                     return .download
    case .follow:                       return .follow
    case .fork:                         return .fork
    case .forkApply:                    return .forkApply
    case .gist:                         return .gist
    case .gitHubAppAuthorization:       return .gitHubAppAuthorization
    case .gollum:                       return .gollum
    case .installation:                 return .installation
    case .installationRepositories:     return .installationRepositories
    case .issueComment:                 return .issueComment
    case .issues:                       return .issues
    case .label:                        return .label
    case .marketplacePurchase:          return .marketplacePurchase
    case .member:                       return .member
    case .membership:                   return .membership
    case .meta:                         return .meta
    case .milestone:                    return .milestone
    case .organization:                 return .organization
    case .orgBlock:                     return .orgBlock
    case .package:                      return .package
    case .pageBuild:                    return .pageBuild
    case .project:                      return .project
    case .projectCard:                  return .projectCard
    case .projectColumn:                return .projectColumn
    case .public:                       return .public
    case .pullRequest:                  return .pullRequest
    case .pullRequestReview:            return .pullRequestReview
    case .pullRequestReviewComment:     return .pullRequestReviewComment
    case .push:                         return .push
    case .release:                      return .release
    case .repository:                   return .repository
    case .repositoryDispatch:           return .repositoryDispatch
    case .repositoryImport:             return .repositoryImport
    case .repositoryVulnerabilityAlert: return .repositoryVulnerabilityAlert
    case .securityAdvisory:             return .securityAdvisory
    case .sponsorship:                  return .sponsorship
    case .star:                         return .star
    case .status:                       return .status
    case .team:                         return .team
    case .teamAdd:                      return .teamAdd
    case .watch:                        return .watch
    }
  }
}
