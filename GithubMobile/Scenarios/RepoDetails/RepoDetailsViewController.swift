//
//  RepoDetailsViewController.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class RepoDetailsViewController: BaseViewController {

  private lazy var navigationBarView: NavigationBarView = {
    let navigationBarView = NavigationBarView()
    return navigationBarView
  }()
  
  private let viewModel: RepoDetailsViewModelType
  init(viewModel: RepoDetailsViewModelType) {
    self.viewModel = viewModel
    super.init()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }
}

private extension RepoDetailsViewController {
  func setup() {
    setupView()
    setupBinding()
  }

  func setupView() {
    navigationBarView.attachToTop(of: view)
    navigationBarView.isBackButtonVisible.value = true
    navigationBarView.isSearchButtonVisible.value = false
    view.backgroundColor = AppColors.global.backgroundColor
  }

  func setupBinding() {
    navigationBarView.backButton.reactive.pressed = CocoaAction(viewModel.inputs.dismiss)
  }
}
