//
//  SearchRepository.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import Moya
import XCGLogger
import ReactiveSwift

class SearchRepository {
  private let logger: XCGLogger?
  private let provider: MoyaProvider<SearchService>
  private let searchRepositoryConverter: SearchRepositoryConverter

  init(provider: MoyaProvider<SearchService> = MoyaProvider<SearchService>(),
        logger: XCGLogger? = nil,
        searchRepositoryConverter: SearchRepositoryConverter = SearchRepositoryConverter()) {
     self.provider = provider
     self.logger = logger
    self.searchRepositoryConverter = searchRepositoryConverter
   }

  func search(by query: String, page: Int) -> SignalProducer<SearchRepositoryResult, Error> {
    return provider.defaultRequest(.searchRepository(query: query, page: page), of: SearchRepositoryResultResponse.self)
    .map(searchRepositoryConverter.from)
    .on(failed: { [weak self] error in
      self?.logger?.error("Unable to get repositories search result. Error: \(error)")
    })
  }
}
