//
//  RepoDetails.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import OAuthSwift
import Domain
import ReactiveSwift

protocol RepoDetailsCoordinatorDelegate: class {
  func repoDetailsCoordinatorDidDismiss(_ coordinator: RepoDetailsCoordinator)
}

class RepoDetailsCoordinator: Coordinator {
  typealias Delegate = RepoDetailsCoordinatorDelegate

  var viewModel: RepoDetailsViewModel?
  var viewController: RepoDetailsViewController?

  weak var delegate: Delegate?

  private let presentViewController: UINavigationController
  private let credential: OAuthSwiftCredential
  private let useCaseProvider: UseCaseProvider
  private let repositoryName: String

  init(presentViewController: UINavigationController,
       credential: OAuthSwiftCredential,
       useCaseProvider: UseCaseProvider,
       repositoryName: String) {
    self.presentViewController = presentViewController
    self.credential = credential
    self.useCaseProvider = useCaseProvider
    self.repositoryName = repositoryName
  }

  override func start() {
    let repoDetailsViewModel = RepoDetailsViewModel()
    let repoDetailsViewController = RepoDetailsViewController(viewModel: repoDetailsViewModel)
    presentViewController.pushViewController(repoDetailsViewController, animated: true)

    self.viewModel = repoDetailsViewModel
    self.viewController = repoDetailsViewController

    reactive.dismiss <~ repoDetailsViewModel.dismiss.values
  }
}

private extension RepoDetailsCoordinator {
  func dismiss() {
    presentViewController.popViewController(animated: true)
    delegate?.repoDetailsCoordinatorDidDismiss(self)
  }
}

private extension Reactive where Base: RepoDetailsCoordinator {
  var dismiss: BindingTarget<Void> {
    return makeBindingTarget { base, _ in
      base.dismiss()
    }
  }
}
