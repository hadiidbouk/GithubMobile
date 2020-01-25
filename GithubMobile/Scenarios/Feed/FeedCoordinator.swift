//
//  FeedCoordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

class FeedCoordinator: Coordinator {

  var childCoordinators: [Coordinator] = []

  private var viewController: FeedViewController?

  private let presentViewController: UINavigationController

  init(presentViewController: UINavigationController) {
    self.presentViewController = presentViewController
  }

  func start() {
    let feedViewController = FeedViewController()
    presentViewController.pushViewController(feedViewController, animated: true)
    viewController = feedViewController
  }
}
