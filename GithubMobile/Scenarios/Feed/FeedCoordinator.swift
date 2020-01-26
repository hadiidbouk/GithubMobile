//
//  FeedCoordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import OAuthSwift
import Domain

class FeedCoordinator: Coordinator {

  var childCoordinators: [Coordinator] = []

  private var viewController: FeedViewController?

  private let presentViewController: UINavigationController
  private let credential: OAuthSwiftCredential
  private let useCaseProvider: UseCaseProvider

  init(presentViewController: UINavigationController, credential: OAuthSwiftCredential, useCaseProvider: UseCaseProvider) {
    self.presentViewController = presentViewController
    self.credential = credential
    self.useCaseProvider = useCaseProvider
  }

  func start() {
    guard let oauth = OAuthSwiftCredential.load() else {
      return
    }
    let viewModel = FeedViewModel(token: oauth.oauthToken,
                                  getAuthenticatedUserUseCase: useCaseProvider.makeGetAutenticatedUserUseCase(),
                                  getReceivedEventsUseCase: useCaseProvider.makeGetUserReceivedEventsUseCase())
    let feedViewController = FeedViewController(viewModel: viewModel)
    presentViewController.pushViewController(feedViewController, animated: true)
    viewController = feedViewController
  }
}
