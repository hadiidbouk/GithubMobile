//
//  GetSearchRepositoriesUseCase.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import XCGLogger
import ReactiveSwift

public class GetSearchRepositoriesUseCase: Domain.GetSearchRepositoriesUseCase {
  private let repository: SearchRepository
  private let logger: XCGLogger?

  init(repository: SearchRepository, logger: XCGLogger? = nil) {
    self.repository = repository
    self.logger = logger
  }

  /// Search for repository by the given query
  /// - Parameters:
  ///   - query: the query used to search the repositories names
  ///   - page: the page used in repositories list pagination
  ///   - token: the OAuth2 token returned from the server
  /// - Returns: A Producer which sends one object.
  ///
  public func search(by query: String, page: Int, token: String) -> SignalProducer<SearchRepositoryResult, Error> {
    return repository.search(by: query, page: page, token: token)
  }
}
