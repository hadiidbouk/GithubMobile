//
//  GetRepositoryUseCase.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/28/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

public protocol GetRepositoryUseCase {
  func get(by fullName: String, token: String) -> SignalProducer<Repository, Error>
}

