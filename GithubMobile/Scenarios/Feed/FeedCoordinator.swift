//
//  FeedCoordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import OAuthSwift

class FeedCoordinator: Coordinator {

  var childCoordinators: [Coordinator] = []

  private var viewController: FeedViewController?

  private let presentViewController: UINavigationController
  private let credential: OAuthSwiftCredential

  init(presentViewController: UINavigationController, credential: OAuthSwiftCredential) {
    self.presentViewController = presentViewController
    self.credential = credential
  }

  func start() {
    let feedViewController = FeedViewController()
    presentViewController.pushViewController(feedViewController, animated: true)
    viewController = feedViewController
  }
}
