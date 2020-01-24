//
//  Coordinator.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

protocol Coordinator: ReactiveExtensionsProvider {
    func start()
}
