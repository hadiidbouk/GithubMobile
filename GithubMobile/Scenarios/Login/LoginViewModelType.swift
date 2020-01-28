//
//  LoginViewModelType.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/24/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift
import OAuthSwift

protocol LoginViewModelTypeInputs {
  var login: Action<Void, OAuth2Swift, Never> { get }
  var loginBrowserDismissed: MutableProperty<Bool> { get }
}

protocol LoginViewModelTypeOutputs {
  var isLoading: Property<Bool> { get }
}

protocol LoginViewModelType {
  var inputs: LoginViewModelTypeInputs { get }
  var outputs: LoginViewModelTypeOutputs { get }
}
