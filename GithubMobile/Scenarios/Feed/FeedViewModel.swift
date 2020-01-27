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
  private typealias loadReceivedEventsInput = (User, Int)

  let isLoading: Property<Bool>
  let loadOldSections: Action<Int, Int, Error>
  let refresh: Action<Void, Void, Error>
  let sections: Property<[FeedSectionModel]>

  let page: Property<Int>
  let isVisible =  MutableProperty<Bool>(false)
  let isLoadingOldSections: Property<Bool>
  let isRefreshing: Property<Bool>

  var inputs: FeedViewModelTypeInputs { return self }
  var outputs: FeedViewModelTypeOutputs { return self }

  private let loadUser: Action<Void, User, Error>
  private let loadReceivedEvents: Action<loadReceivedEventsInput, [Event], Error>
  private let loadNewEvents: Action<User, [Event], Error>
  private let mutableSectionModels = MutableProperty<[FeedSectionModel]>([])
  private let mutableOldSectionModels = MutableProperty<[FeedSectionModel]>([])
  private let mutableNewSectionModels = MutableProperty<[FeedSectionModel]>([])
  private let mutablePage: MutableProperty<Int>
  private let mutableIsLoadingOldSections = MutableProperty(false)

  init(token: String,
       initialPageNumber: Int = 1,
       maxPageNumber: Int = 9,
       getAuthenticatedUserUseCase: GetAuthenticatedUserUseCase,
       getReceivedEventsUseCase: GetUserReceivedEventsUseCase,
       feedSectionConverter: FeedSectionConverter = FeedSectionConverter()) {

    mutablePage = MutableProperty(initialPageNumber)
    page = Property(mutablePage)

    loadUser = Action { getAuthenticatedUserUseCase.get(token: token) }
    loadUser <~ isVisible.producer.skipRepeats().map(value: ())

    loadReceivedEvents = Action { input in
      let (user, page) = input
      return getReceivedEventsUseCase.get(token: token, username: user.username, page: page)
    }
    loadReceivedEvents <~ loadUser.values.producer.combineLatest(with: mutablePage.producer)

    isLoading = loadUser.isExecuting.or(loadReceivedEvents.isExecuting).and(mutableSectionModels.map { $0.isEmpty })

    sections = Property(mutableSectionModels)

    mutableOldSectionModels <~ loadReceivedEvents.values.map { $0.map(feedSectionConverter.from) }
    mutableSectionModels <~ mutableSectionModels.producer.sample(with: mutableOldSectionModels.producer).map { input -> [FeedSectionModel] in
      var (models, newModels) = input
      models.append(contentsOf: newModels)
      return models
    }

    loadOldSections = Action { $0 > maxPageNumber ? .empty : SignalProducer(value: $0) }
    isLoadingOldSections = Property(mutableIsLoadingOldSections)

    mutableIsLoadingOldSections <~ loadOldSections.values.map(value: true)
    mutableIsLoadingOldSections <~ mutableOldSectionModels.map(value: false)

    mutablePage <~ loadOldSections.values

    refresh = Action { SignalProducer(value: $0) }
    loadNewEvents = Action { getReceivedEventsUseCase.get(token: token, username: $0.username, page: initialPageNumber) }
    loadNewEvents <~ loadUser.values.sample(with: refresh.values).map { $0.0 }

    mutableNewSectionModels <~ loadNewEvents.values.map { $0.map(feedSectionConverter.from) }
    mutableSectionModels <~ mutableSectionModels.producer.sample(with: mutableNewSectionModels.producer).map { input -> [FeedSectionModel] in
      var (models, newModels) = input
      let setModels = Set(models)
      let setNewModels = Set(newModels)
      let newSet = setNewModels.subtracting(setModels)
      models.insert(contentsOf: Array(newSet), at: 0)
      return models
    }

    isRefreshing = loadNewEvents.isExecuting
  }
}
