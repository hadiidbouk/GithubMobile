//
//  LoginCoordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
  private let presentViewController: UINavigationController
  private var viewController: LoginViewController?

  init(presentViewController: UINavigationController) {
    self.presentViewController = presentViewController
  }

  func start() {
    let loginViewController = LoginViewController()
    presentViewController.pushViewController(loginViewController, animated: true)
    viewController = loginViewController
  }
}
