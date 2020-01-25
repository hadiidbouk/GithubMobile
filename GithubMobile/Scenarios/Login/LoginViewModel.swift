//
//  LoginViewModel.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/24/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift
import OAuthSwift

class LoginViewModel: LoginViewModelType, LoginViewModelTypeInputs, LoginViewModelTypeOutputs {
  var login: Action<Void, OAuth2Swift, Never>

  var inputs: LoginViewModelTypeInputs { return self }
  var outputs: LoginViewModelTypeOutputs { return self }

  init(authConfig: AuthConfig = AuthConfig()) {
    login = Action {
      let oauthswift = OAuth2Swift(consumerKey: authConfig.clientId,
                                   consumerSecret: authConfig.clientSecret,
                                   authorizeUrl: authConfig.authorizeUrl,
                                   accessTokenUrl: authConfig.accessTokenUrl,
                                   responseType: authConfig.responseType)
      return SignalProducer(value: oauthswift)
    }
  }
}
