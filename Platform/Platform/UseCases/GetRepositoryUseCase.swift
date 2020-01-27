//
//  GetRepositoryUseCase.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/28/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import XCGLogger
import ReactiveSwift

public class GetRepositoryUseCase: Domain.GetRepositoryUseCase {
  private let repository: ReposRepository
  private let logger: XCGLogger?

  init(repository: ReposRepository, logger: XCGLogger? = nil) {
    self.repository = repository
    self.logger = logger
  }

  /// Get a repository by the given full name
  /// - Parameters:
  ///   - fullname: the repository full name, it should contains the username/repoName
  ///   - token: the OAuth2 token returned from the server
  /// - Returns: A Producer which sends one object.
  ///
  public func get(by fullName: String, token: String) -> SignalProducer<Repository, Error> {
    return repository.getRepository(by: fullName, token: token)
  }
}
