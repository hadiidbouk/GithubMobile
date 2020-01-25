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
import AuthenticationServices

class LoginCoordinator: Coordinator {
  private var viewController: LoginViewController?
  private var viewModel: LoginViewModel?
  private var oauthSwift: OAuth2Swift?

  private let presentViewController: UINavigationController
  private let authConfig: AuthConfig

  init(presentViewController: UINavigationController,
       authConfig: AuthConfig = AuthConfig()) {
    self.presentViewController = presentViewController
    self.authConfig = authConfig
  }

  func start() {
    let loginViewModel = LoginViewModel()
    let loginViewController = LoginViewController(viewModel: loginViewModel)
    presentViewController.pushViewController(loginViewController, animated: true)

    viewModel = loginViewModel
    viewController = loginViewController

    reactive.login <~ loginViewModel.login.values
  }
}

private extension LoginCoordinator {
  func login(oauthSwift: OAuth2Swift) {
    guard let viewController = viewController,
      let redirectUri = URL(string: authConfig.redirectUri) else {
      return
    }
    oauthSwift.authorizeURLHandler = SafariURLHandler(viewController: viewController, oauthSwift: oauthSwift)
    let _ = oauthSwift.authorize(withCallbackURL: redirectUri, scope: authConfig.scope, state: generateState(withLength: 20)) { result in
        switch result {
        case .success(let a):
            print(a)
        case .failure(let error):
            print(error.description)
        }
    }
    self.oauthSwift = oauthSwift
  }
}

private extension Reactive where Base: LoginCoordinator {
  var login: BindingTarget<OAuth2Swift> {
    return makeBindingTarget { base, oauthSwift in
      base.login(oauthSwift: oauthSwift)
    }
  }
}
