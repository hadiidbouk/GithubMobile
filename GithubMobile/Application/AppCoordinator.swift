//
//  AppCoordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import OAuthSwift
import Platform
import XCGLogger

class AppCoordinator: Coordinator {
  let window: UIWindow
  let rootViewController: UINavigationController
  let logger: XCGLogger?

  init(window: UIWindow, logger: XCGLogger?) {
    self.window = window
    self.logger = logger
    rootViewController = UINavigationController()
    rootViewController.setNavigationBarHidden(true, animated: false)
  }

  override func start() {
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
    let loginCoordinator = LoginCoordinator(presentViewController: rootViewController, useCaseProvider: UseCaseProvider(logger: logger))
    loginCoordinator.start()
    childCoordinators.append(loginCoordinator)
  }

  func feed(credential: OAuthSwiftCredential) {
    let feedCoordinator = FeedCoordinator(presentViewController: rootViewController, credential: credential, useCaseProvider: UseCaseProvider(logger: logger))
    feedCoordinator.start()
    childCoordinators.append(feedCoordinator)
  }
}
