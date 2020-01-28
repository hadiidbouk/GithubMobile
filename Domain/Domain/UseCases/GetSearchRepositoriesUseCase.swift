//
//  GetSearchRepositoriesUseCase.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

public protocol GetSearchRepositoriesUseCase {
  func search(by query: String, page: Int, token: String) -> SignalProducer<SearchRepositoryResult, Error>
}
