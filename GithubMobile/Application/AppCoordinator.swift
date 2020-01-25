//
//  AppCoordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import OAuthSwift

class AppCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []

  let window: UIWindow
  let rootViewController: UINavigationController

  init(window: UIWindow) {
    self.window = window
    rootViewController = UINavigationController()
    rootViewController.setNavigationBarHidden(true, animated: false)
  }

  func start() {
    window.rootViewController = rootViewController

    if let credential = OAuthSwiftCredential.load() {
      feed(credential: credential)
    } else {
      login()
    }

    window.makeKeyAndVisible()
  }
}

private extension AppCoordinator {
  func login() {
    let loginCoordinator = LoginCoordinator(presentViewController: rootViewController)
    loginCoordinator.start()
    childCoordinators.append(loginCoordinator)
  }

  func feed(credential: OAuthSwiftCredential) {
    let feedCoordinator = FeedCoordinator(presentViewController: rootViewController, credential: credential)
    feedCoordinator.start()
    childCoordinators.append(feedCoordinator)
  }
}
