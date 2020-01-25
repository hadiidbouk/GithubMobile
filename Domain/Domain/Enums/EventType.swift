//
//  EventType.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public enum EventType {
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
