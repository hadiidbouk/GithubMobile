//
//  RepoDetailViewModel.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

class RepoDetailsViewModel: RepoDetailsViewModelType, RepoDetailsViewModelTypeInputs, RepoDetailsViewModelTypeOutputs {

  let dismiss: Action<Void, Void, Never>

  var inputs: RepoDetailsViewModelTypeInputs { return self }
  var outputs: RepoDetailsViewModelTypeOutputs { return self }

  init() {
    dismiss = Action { SignalProducer(value: $0) }
  }
}
