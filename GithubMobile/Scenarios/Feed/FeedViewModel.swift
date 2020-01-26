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
  var feeds: Property<[Event]>

  let isVisible =  MutableProperty<Bool>(false)

  var inputs: FeedViewModelTypeInputs { return self }
  var outputs: FeedViewModelTypeOutputs { return self }

  private let loadUser: Action<Void, User, Error>
  private let loadReceivedEvents: Action<User, [Event], Error>
  
  init(token: String,
       getAuthenticatedUserUseCase: GetAuthenticatedUserUseCase,
       getReceivedEventsUseCase: GetUserReceivedEventsUseCase) {
    loadUser = Action { getAuthenticatedUserUseCase.get(token: token) }
    loadUser <~ isVisible.producer.skipRepeats().map(value: ())

    loadReceivedEvents = Action { user in getReceivedEventsUseCase.get(token: token, username: user.username) }
    loadReceivedEvents <~ loadUser.values

    isLoading = loadUser.isExecuting.or(loadReceivedEvents.isExecuting)

    feeds = Property(initial: [], then: loadReceivedEvents.values)
  }
}
