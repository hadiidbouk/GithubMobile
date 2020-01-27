//
//  UsersRepository.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import Moya
import XCGLogger
import ReactiveSwift

class UsersRepository {
  private let logger: XCGLogger?
  private let provider: MoyaProvider<UserService>
  private let userConverter: UserConverter
  private let eventConverter: EventConverter

  init(provider: MoyaProvider<UserService> = MoyaProvider<UserService>(),
       logger: XCGLogger? = nil,
       userConverter: UserConverter = UserConverter(),
       eventConverter: EventConverter = EventConverter()) {
    self.provider = provider
    self.logger = logger
    self.userConverter = userConverter
    self.eventConverter = eventConverter
  }

  func getAuthenticatedUser(token: String) -> SignalProducer<User, Error> {
    return provider.defaultRequest(.getAuthenticatedUser(token: token), of: UserResponse.self)
      .map(userConverter.from)
      .on(failed: { [weak self] error in
        self?.logger?.error("Unable to get authenticated user. Error: \(error)")
      })
  }

  func getReceivedEvents(token: String, username: String, page: Int) -> SignalProducer<[Event], Error> {
    return provider.defaultRequest(.getReceivedEvents(token: token, username: username, page: page), of: [EventResponse].self)
         .map { [eventConverter] in return $0.map(eventConverter.from) }
         .on(failed: { [weak self] error in
           self?.logger?.error("Unable to get received events. Error: \(error)")
         })
  }
}
