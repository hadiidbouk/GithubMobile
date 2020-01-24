//
//  LoginViewModelType.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/24/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

protocol LoginViewModelTypeInputs {
  var login: Action<Void, String, Never> { get }
}

protocol LoginViewModelTypeOutputs {}

protocol LoginViewModelType {
  var inputs: LoginViewModelTypeInputs { get }
  var outputs: LoginViewModelTypeOutputs { get }
}
