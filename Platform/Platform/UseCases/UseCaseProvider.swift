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
  private let searchRepository: SearchRepository
  private let reposRepository: ReposRepository

  private let logger: XCGLogger?

  public init(logger: XCGLogger?) {
    self.logger = logger

    usersRepository = UsersRepository(logger: logger)
    searchRepository = SearchRepository(logger: logger)
    reposRepository = ReposRepository(logger: logger)
  }

  public func makeGetAutenticatedUserUseCase() -> Domain.GetAuthenticatedUserUseCase {
    return GetAuthenticatedUserUseCase(repository: usersRepository, logger: logger)
  }

  public func makeGetUserReceivedEventsUseCase() -> Domain.GetUserReceivedEventsUseCase {
    return GetUserReceivedEventsUseCase(repository: usersRepository, logger: logger)
  }

  public func makeGetSearchRepositoriesUseCase() -> Domain.GetSearchRepositoriesUseCase {
    return GetSearchRepositoriesUseCase(repository: searchRepository, logger: logger)
  }

  public func makeGetRepositoryUseCase() -> Domain.GetRepositoryUseCase {
    return GetRepositoryUseCase(repository: reposRepository, logger: logger)
  }
}
