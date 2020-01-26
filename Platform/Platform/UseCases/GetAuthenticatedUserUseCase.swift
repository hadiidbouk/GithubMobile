//
//  GetAuthenticatedUserUseCase.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import XCGLogger
import ReactiveSwift

class GetAuthenticatedUserUseCase: Domain.GetAuthenticatedUserUseCase {
  private let repository: UsersRepository
  private let logger: XCGLogger?

  init(repository: UsersRepository, logger: XCGLogger? = nil) {
    self.repository = repository
    self.logger = logger
  }

  /// Get the authenticated user.
  /// - Parameters:
  ///   - token: the oauth 2 token received after login.
  /// - Returns: A Producer which sends one object.
  ///
  func get(token: String) -> SignalProducer<User, Error> {
    return repository.getAuthenticatedUser(token: token)
  }
}
