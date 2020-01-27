//
//  RepoDetailsViewModelType.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

protocol RepoDetailsViewModelTypeInputs {
  var dismiss: Action<Void, Void, Never> { get }
}

protocol RepoDetailsViewModelTypeOutputs {

}

protocol RepoDetailsViewModelType {
  var inputs: RepoDetailsViewModelTypeInputs { get }
  var outputs: RepoDetailsViewModelTypeOutputs { get }
}
