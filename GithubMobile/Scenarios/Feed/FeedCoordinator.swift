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
import ReactiveSwift

class FeedCoordinator: Coordinator {
  private var viewController: FeedViewController?

  private let presentViewController: UINavigationController
  private let credential: OAuthSwiftCredential
  private let useCaseProvider: UseCaseProvider

  init(presentViewController: UINavigationController, credential: OAuthSwiftCredential, useCaseProvider: UseCaseProvider) {
    self.presentViewController = presentViewController
    self.credential = credential
    self.useCaseProvider = useCaseProvider
  }

  override func start() {
    let feedViewModel = FeedViewModel(token: credential.oauthToken,
                                      getAuthenticatedUserUseCase: useCaseProvider.makeGetAutenticatedUserUseCase(),
                                      getReceivedEventsUseCase: useCaseProvider.makeGetUserReceivedEventsUseCase())
    let feedViewController = FeedViewController(viewModel: feedViewModel)
    presentViewController.pushViewController(feedViewController, animated: true)
    viewController = feedViewController

    reactive.search <~ feedViewModel.inputs.search.values
  }
}

extension FeedCoordinator: SearchCoordinator.Delegate {
  func searchCoordinatorDidDismiss(_ coordinator: SearchCoordinator) {
    childCompleted(coordinator: coordinator)
  }
}

private extension FeedCoordinator {
  func search() {
    let searchCoordinator = SearchCoordinator(presentViewController: presentViewController,
                                              credential: credential,
                                              useCaseProvider: useCaseProvider)
    searchCoordinator.start()
    childCoordinators.append(searchCoordinator)
  }
}

private extension Reactive where Base: FeedCoordinator {
  var search: BindingTarget<Void> {
    return makeBindingTarget { base, _ in
      base.search()
    }
  }
}
