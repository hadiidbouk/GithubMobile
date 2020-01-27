//
//  SearchViewModel.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift

class SearchViewModel: SearchViewModelType, SearchViewModelTypeInputs, SearchViewModelTypeOutputs {

  let dismiss: Action<Void, Void, Never>

  let sections: Property<[SearchSectionModel]>

  var outputs: SearchViewModelTypeOutputs { return self }
  var inputs: SearchViewModelTypeInputs { return self }

  init() {
    dismiss = Action { SignalProducer(value: $0) }

    let description = "MarvelAR is an iOS application that present Marvel Heroes 3D Models Using ARKit."
    let data = [SearchSectionModel(id: 1, name: "TideSec/WDScanner", stars: 15, description: description),
                SearchSectionModel(id: 2, name: "TideSec/WDScanner", stars: 15, description: description),
                SearchSectionModel(id: 3, name: "TideSec/WDScanner", stars: 15, description: description),
                SearchSectionModel(id: 4, name: "TideSec/WDScanner", stars: 15, description: description),
                SearchSectionModel(id: 5, name: "TideSec/WDScanner", stars: 15, description: description),
                SearchSectionModel(id: 6, name: "TideSec/WDScanner", stars: 15, description: description),
                SearchSectionModel(id: 7, name: "TideSec/WDScanner", stars: 15, description: description)]
    sections = Property(value: data)
  }
}

