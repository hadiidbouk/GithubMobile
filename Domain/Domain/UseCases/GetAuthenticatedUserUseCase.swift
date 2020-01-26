//
//  GetAuthenticatedUserUseCase.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

public protocol GetAuthenticatedUserUseCase {
  func get(token: String) -> SignalProducer<User, Error>
}
