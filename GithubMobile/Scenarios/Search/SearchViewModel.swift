//
//  SearchViewModel.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import ReactiveSwift

class SearchViewModel: SearchViewModelType, SearchViewModelTypeInputs, SearchViewModelTypeOutputs {
  let dismiss: Action<Void, Void, Never>
  let search: Action<String, String, Never>
  var repoDetails: Action<String, String, Never>

  let sections: Property<[SearchSectionModel]>

  var outputs: SearchViewModelTypeOutputs { return self }
  var inputs: SearchViewModelTypeInputs { return self }

  private let loadRepositories: Action<String, SearchRepositoryResult, Error>
  private let mutableSections = MutableProperty<[SearchSectionModel]>([])

  init(token: String,
       initialPageNumber: Int = 1,
       maxPageNumber: Int = 9,
       getSearchRepositoriesUseCase: GetSearchRepositoriesUseCase,
       searchRepositoryConverter: SearchRepositorySectionConverter = SearchRepositorySectionConverter()) {

    dismiss = Action { SignalProducer(value: $0) }
    search = Action { SignalProducer(value: $0) }
    repoDetails = Action { SignalProducer(value: $0) }
    
    loadRepositories = Action { getSearchRepositoriesUseCase.search(by: $0, page: initialPageNumber, token: token) }
    loadRepositories <~ search.values
    mutableSections <~ loadRepositories.values.map { searchRepositoryConverter.from($0.items) }
    sections = Property(mutableSections)

    mutableSections <~ search.values.map(value: [])
  }
}

