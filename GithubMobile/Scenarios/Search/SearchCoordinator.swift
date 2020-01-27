//
//  SearchCoordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import Domain
import OAuthSwift
import ReactiveSwift

class SearchCoordinator: Coordinator {

  let childCoordinators: [Coordinator] = []

  var viewModel: SearchViewModel?
  var viewController: SearchViewController?

  private let presentViewController: UINavigationController
  private let credential: OAuthSwiftCredential
  private let useCaseProvider: UseCaseProvider

  init(presentViewController: UINavigationController, credential: OAuthSwiftCredential, useCaseProvider: UseCaseProvider) {
    self.presentViewController = presentViewController
    self.credential = credential
    self.useCaseProvider = useCaseProvider
  }
  func start() {
    let searchViewModel = SearchViewModel(token: credential.oauthToken,
                                          getSearchRepositoriesUseCase: useCaseProvider.makeGetSearchRepositoriesUseCase())
    let searchViewController = SearchViewController(viewModel: searchViewModel)
    presentViewController.pushViewController(searchViewController, animated: true)

    viewModel = searchViewModel
    viewController = searchViewController

    reactive.dismiss <~ searchViewModel.dismiss.values
  }
}

private extension SearchCoordinator {
  func dismiss() {
    presentViewController.popViewController(animated: true)
  }
}

private extension Reactive where Base: SearchCoordinator {
  var dismiss: BindingTarget<Void> {
    return makeBindingTarget { base, _ in
      base.dismiss()
    }
  }
}
