//
//  SearchViewModelType.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

protocol SearchViewModelTypeInputs {
  var dismiss: Action<Void, Void, Never> { get }
  var search: Action<String, String, Never> { get}
}

protocol SearchViewModelTypeOutputs {
  var sections: Property<[SearchSectionModel]> { get }
}

protocol SearchViewModelType {
  var inputs: SearchViewModelTypeInputs { get }
  var outputs: SearchViewModelTypeOutputs { get }
}
