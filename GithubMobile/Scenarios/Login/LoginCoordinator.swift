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

class LoginCoordinator: Coordinator {
  private let presentViewController: UINavigationController
  private var viewController: LoginViewController?
  private var viewModel: LoginViewModel?

  init(presentViewController: UINavigationController) {
    self.presentViewController = presentViewController
  }

  func start() {
    let loginViewModel = LoginViewModel()
    let loginViewController = LoginViewController(viewModel: loginViewModel)
    presentViewController.pushViewController(loginViewController, animated: true)

    viewModel = loginViewModel
    viewController = loginViewController

    reactive.shouldOpenSafari <~ loginViewModel.login.values
  }
}

private extension LoginCoordinator {
  func openSafari(urlString: String) {
    guard let url = URL(string: urlString) else {
      return
    }
    let safariViewController = SFSafariViewController(url: url)
    viewController?.present(safariViewController, animated: true, completion: nil)
  }
}

private extension Reactive where Base: LoginCoordinator {
  var shouldOpenSafari: BindingTarget<String> {
    return makeBindingTarget { base, urlString in
      base.openSafari(urlString: urlString)
    }
  }
}
