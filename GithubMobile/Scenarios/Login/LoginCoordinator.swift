//
//  LoginCoordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import SafariServices
import ReactiveSwift
import OAuthSwift
import Domain

class LoginCoordinator: Coordinator {
  private var viewController: LoginViewController?
  private var viewModel: LoginViewModel?
  private var oauthSwift: OAuth2Swift?

  private let presentViewController: UINavigationController
  private let authConfig: AuthConfig
  private let useCaseProvider: UseCaseProvider

  init(presentViewController: UINavigationController,
       useCaseProvider: UseCaseProvider,
       authConfig: AuthConfig = AuthConfig()) {
    self.presentViewController = presentViewController
    self.useCaseProvider = useCaseProvider
    self.authConfig = authConfig
  }

  override func start() {
    let loginViewModel = LoginViewModel()
    let loginViewController = LoginViewController(viewModel: loginViewModel)
    presentViewController.pushViewController(loginViewController, animated: true)

    viewModel = loginViewModel
    viewController = loginViewController

    reactive.login <~ loginViewModel.login.values
  }

  func feed(credential: OAuthSwiftCredential) {
    let feedCoordinator = FeedCoordinator(presentViewController: presentViewController, credential: credential, useCaseProvider: useCaseProvider)
    feedCoordinator.start()
    childCoordinators.append(feedCoordinator)
  }
}

private extension LoginCoordinator {
  func login(oauthSwift: OAuth2Swift) {
    guard let viewController = viewController,
      let redirectUri = URL(string: authConfig.redirectUri) else {
      return
    }
    let safariHandler = SafariURLHandler(viewController: viewController, oauthSwift: oauthSwift)
    safariHandler.delegate = self
    oauthSwift.authorizeURLHandler = safariHandler
    let state = generateState(withLength: 20)
    let _ = oauthSwift.authorize(withCallbackURL: redirectUri, scope: authConfig.scope, state: state) {[weak self] result in
        switch result {
        case .success(let oauthSwift):
          oauthSwift.credential.save()
          self?.feed(credential: oauthSwift.credential)
        case .failure(let error):
          print(error.description)
        }
    }
    self.oauthSwift = oauthSwift
  }
}

extension LoginCoordinator: SFSafariViewControllerDelegate {
  func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
    self.viewModel?.inputs.loginBrowserDismissed.value = true
  }
}

private extension Reactive where Base: LoginCoordinator {
  var login: BindingTarget<OAuth2Swift> {
    return makeBindingTarget { base, oauthSwift in
      base.login(oauthSwift: oauthSwift)
    }
  }
}
