//
//  ReposRepository.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/28/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import Moya
import XCGLogger
import ReactiveSwift

class ReposRepository {
  private let logger: XCGLogger?
  private let provider: MoyaProvider<ReposService>
  private let repositoryConverter: RepositoryConverter

  init(provider: MoyaProvider<ReposService> = MoyaProvider<ReposService>(),
        logger: XCGLogger? = nil,
        repositoryConverter: RepositoryConverter = RepositoryConverter()) {
    self.provider = provider
    self.logger = logger
    self.repositoryConverter = repositoryConverter
   }

  func getRepository(by fullName: String, token: String) -> SignalProducer<Repository, Error> {
    return provider.defaultRequest(.getRepository(token: token, repositoryFullName: fullName), of: RepositoryResponse.self)
    .map(repositoryConverter.from)
    .on(failed: { [weak self] error in
      self?.logger?.error("Unable to get repository. Error: \(error)")
    })
  }
}
