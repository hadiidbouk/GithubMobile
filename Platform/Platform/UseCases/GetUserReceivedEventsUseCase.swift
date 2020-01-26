//
//  GetReceivedEventsUseCase.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import ReactiveSwift
import XCGLogger

public class GetUserReceivedEventsUseCase: Domain.GetUserReceivedEventsUseCase {
  private let repository: UsersRepository
  private let logger: XCGLogger?

  init(repository: UsersRepository, logger: XCGLogger? = nil) {
    self.repository = repository
    self.logger = logger
  }

  /// Get the received events for the given username.
  /// - Parameters:
  ///   - token: the oauth 2 token received after login.
  ///   - username: the account username which receives the events.
  /// - Returns: A Producer which sends one object.
  ///
  public func get(token: String, username: String) -> SignalProducer<Event, Error> {
    return repository.getReceivedEvents(token: token, username: username)
  }
}

