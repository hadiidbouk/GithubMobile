//
//  RepoDetailViewModel.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift
import Domain

class RepoDetailsViewModel: RepoDetailsViewModelType, RepoDetailsViewModelTypeInputs, RepoDetailsViewModelTypeOutputs {
  let isVisible =  MutableProperty<Bool>(false)
  let dismiss: Action<Void, Void, Never>
  let goToGitHub: Action<Void, Void, Never>

  let isLoading: Property<Bool>
  let repository: Property<Repository?>

  var inputs: RepoDetailsViewModelTypeInputs { return self }
  var outputs: RepoDetailsViewModelTypeOutputs { return self }

  private let load: Action<Void, Repository, Error>

  init(token: String,
       repositoryFullName: String,
       getRepositoryUseCase: GetRepositoryUseCase) {

    dismiss = Action { SignalProducer(value: $0) }
    goToGitHub = Action { SignalProducer(value: $0) }

    load = Action { getRepositoryUseCase.get(by: repositoryFullName, token: token) }
    load <~ isVisible.map(value: ())

    isLoading = load.isExecuting

    repository = Property(initial: nil, then: load.values)
  }
}
