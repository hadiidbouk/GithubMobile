//
//  Coordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

class Coordinator: NSObject {
  var childCoordinators: [Coordinator] = []

  open func start() { }

  func childCompleted(coordinator: Coordinator) {
    if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
      childCoordinators.remove(at: index)
    }
  }
}
