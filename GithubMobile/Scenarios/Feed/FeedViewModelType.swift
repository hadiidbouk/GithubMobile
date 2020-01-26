//
//  FeedViewModelType.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain
import ReactiveSwift

protocol FeedViewModelTypeInputs {
  var isVisible: MutableProperty<Bool> { get }
}

protocol FeedViewModelTypeOutputs {
  var isLoading: Property<Bool> { get }
  var feeds: Property<[Event]> { get }

}

protocol FeedViewModelType {
  var inputs: FeedViewModelTypeInputs { get }
  var outputs: FeedViewModelTypeOutputs { get }
}
