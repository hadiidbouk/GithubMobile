//
//  FeedViewModel.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import ReactiveSwift

class FeedViewModel: FeedViewModelType, FeedViewModelTypeInputs, FeedViewModelTypeOutputs {
  let isLoading: Property<Bool>
  let isVisible =  MutableProperty<Bool>(false)

  var inputs: FeedViewModelTypeInputs { return self }
  var outputs: FeedViewModelTypeOutputs { return self }

  private let loadUser: Action<Void, User, Error>

  init(token: String,
       getAuthenticatedUserUseCase: GetAuthenticatedUserUseCase) {
    loadUser = Action { getAuthenticatedUserUseCase.get(token: token) }
    loadUser <~ isVisible.producer.skipRepeats().map(value: ())

    isLoading = loadUser.isExecuting
  }
}
