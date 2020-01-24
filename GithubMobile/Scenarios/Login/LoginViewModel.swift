//
//  LoginViewModel.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/24/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

class LoginViewModel: LoginViewModelType, LoginViewModelTypeInputs, LoginViewModelTypeOutputs {
  var login: Action<Void, String, Never>

  var inputs: LoginViewModelTypeInputs { return self }
  var outputs: LoginViewModelTypeOutputs { return self }

  init(authConfig: AuthConfig = AuthConfig()) {
    login = Action {
      let url = authConfig.generateUrl()
      return SignalProducer(value: url)
    }
  }
}
