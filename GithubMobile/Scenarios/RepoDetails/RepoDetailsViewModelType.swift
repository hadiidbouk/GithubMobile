//
//  RepoDetailsViewModelType.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift
import Domain

protocol RepoDetailsViewModelTypeInputs {
  var dismiss: Action<Void, Void, Never> { get }
  var isVisible: MutableProperty<Bool> { get }
  var goToGitHub: Action<Void, Void, Never> { get }
}

protocol RepoDetailsViewModelTypeOutputs {
  var isLoading: Property<Bool> { get }
  var repository: Property<Repository?> { get }
}

protocol RepoDetailsViewModelType {
  var inputs: RepoDetailsViewModelTypeInputs { get }
  var outputs: RepoDetailsViewModelTypeOutputs { get }
}
