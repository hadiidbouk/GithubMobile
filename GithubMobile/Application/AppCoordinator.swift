//
//  AppCoordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []

  let window: UIWindow
  let rootViewController: UINavigationController
  let loginCoordinator: LoginCoordinator

  init(window: UIWindow) {
    self.window = window
    rootViewController = UINavigationController()
    rootViewController.setNavigationBarHidden(true, animated: false)
    loginCoordinator = LoginCoordinator(presentViewController: rootViewController)
  }

  func start() {
    window.rootViewController = rootViewController
    loginCoordinator.start()
    window.makeKeyAndVisible()
  }
}
