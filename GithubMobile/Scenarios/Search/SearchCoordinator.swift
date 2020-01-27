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

protocol SearchCoordinatorDelegate: class {
  func searchCoordinatorDidDismiss(_ coordinator: SearchCoordinator)
}

class SearchCoordinator: Coordinator {
  typealias Delegate = SearchCoordinatorDelegate
  
  var viewModel: SearchViewModel?
  var viewController: SearchViewController?

  weak var delegate: Delegate?

  private let presentViewController: UINavigationController
  private let credential: OAuthSwiftCredential
  private let useCaseProvider: UseCaseProvider

  init(presentViewController: UINavigationController, credential: OAuthSwiftCredential, useCaseProvider: UseCaseProvider) {
    self.presentViewController = presentViewController
    self.credential = credential
    self.useCaseProvider = useCaseProvider
  }

  override func start() {
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
    delegate?.searchCoordinatorDidDismiss(self)
  }

  func repoDetails() {
    let repoDetailsCoordinator = RepoDetailsCoordinator(presentViewController: presentViewController,
                                                        credential: credential,
                                                        useCaseProvider: useCaseProvider)
    repoDetailsCoordinator.start()
    childCoordinators.append(repoDetailsCoordinator)
  }
}

private extension Reactive where Base: SearchCoordinator {
  var dismiss: BindingTarget<Void> {
    return makeBindingTarget { base, _ in
      base.dismiss()
    }
  }

  var repoDetails: BindingTarget<Void> {
    return makeBindingTarget { base, _ in
      base.repoDetails()
    }
  }
}
