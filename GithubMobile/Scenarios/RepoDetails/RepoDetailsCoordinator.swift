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
import SafariServices

protocol RepoDetailsCoordinatorDelegate: class {
  func repoDetailsCoordinatorDidDismiss(_ coordinator: RepoDetailsCoordinator)
}

class RepoDetailsCoordinator: Coordinator {
  typealias Delegate = RepoDetailsCoordinatorDelegate

  var viewModel: RepoDetailsViewModel?
  var viewController: RepoDetailsViewController?
  var safariViewController: SFSafariViewController?

  weak var delegate: Delegate?

  private let presentViewController: UINavigationController
  private let credential: OAuthSwiftCredential
  private let useCaseProvider: UseCaseProvider
  private let repositoryFullName: String

  init(presentViewController: UINavigationController,
       credential: OAuthSwiftCredential,
       useCaseProvider: UseCaseProvider,
       repositoryFullName: String) {
    self.presentViewController = presentViewController
    self.credential = credential
    self.useCaseProvider = useCaseProvider
    self.repositoryFullName = repositoryFullName
  }

  override func start() {
    let repoDetailsViewModel = RepoDetailsViewModel(token: credential.oauthToken,
                                                    repositoryFullName: repositoryFullName,
                                                    getRepositoryUseCase: useCaseProvider.makeGetRepositoryUseCase())
    let repoDetailsViewController = RepoDetailsViewController(viewModel: repoDetailsViewModel)
    presentViewController.pushViewController(repoDetailsViewController, animated: true)

    self.viewModel = repoDetailsViewModel
    self.viewController = repoDetailsViewController

    reactive.dismiss <~ repoDetailsViewModel.inputs.dismiss.values
    reactive.goToGitHub <~ repoDetailsViewModel.inputs.goToGitHub.values
  }
}

extension RepoDetailsCoordinator: SFSafariViewControllerDelegate {
  func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
    presentViewController.popViewController(animated: true)
  }
}

private extension RepoDetailsCoordinator {
  func dismiss() {
    presentViewController.popViewController(animated: true)
    delegate?.repoDetailsCoordinatorDidDismiss(self)
  }

  func goToGitHub() {
    let urlString = "https://github.com/\(repositoryFullName)"
    let url = URL(string: urlString)!
    safariViewController = SFSafariViewController(url: url)
    safariViewController?.delegate = self
    presentViewController.pushViewController(safariViewController!, animated: true)
  }
}

private extension Reactive where Base: RepoDetailsCoordinator {
  var dismiss: BindingTarget<Void> {
    return makeBindingTarget { base, _ in
      base.dismiss()
    }
  }

  var goToGitHub: BindingTarget<Void> {
    return makeBindingTarget { base, _ in
      base.goToGitHub()
    }
  }
}
