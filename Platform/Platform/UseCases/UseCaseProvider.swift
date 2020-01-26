//
//  UseCaseProvider.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import XCGLogger

public class UseCaseProvider: Domain.UseCaseProvider {
  private let usersRepository: UsersRepository
  private let logger: XCGLogger?

  public init(logger: XCGLogger?) {
    self.logger = logger

    usersRepository = UsersRepository(logger: logger)
  }

  public func makeGetAutenticatedUserUseCase() -> Domain.GetAuthenticatedUserUseCase {
    return GetAuthenticatedUserUseCase(repository: usersRepository, logger: logger)
  }
}
