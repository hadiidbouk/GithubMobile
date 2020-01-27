//
//  BaseViewController.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import ReactiveSwift

class BaseViewController: UIViewController {
  private let mutableIsVisible = MutableProperty(false)

  var isVisible: Property<Bool> {
    return Property(mutableIsVisible)
  }

  init() {
    super.init(nibName: nil, bundle: nil)
    let willAppear = reactive.trigger(for: #selector(viewWillAppear(_:))).map(value: true)
    let willDisappear = reactive.trigger(for: #selector(viewWillDisappear(_:))).map(value: false)
    mutableIsVisible <~ Signal.merge(willAppear, willDisappear)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
