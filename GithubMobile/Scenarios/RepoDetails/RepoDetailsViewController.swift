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

  private lazy var loadingView: LoadingView = {
    let loadingView = LoadingView()
    view.addSubview(loadingView)
    return loadingView
  }()
  
  private lazy var headerView: UIView = {
    let headerView = UIView()
    headerView.backgroundColor = AppColors.repoDetails.headerViewBackgroundColor
    view.addSubview(headerView)
    return headerView
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.textColor = AppColors.repoDetails.titleLabelTextColor
    headerView.addSubview(label)
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15)
    label.numberOfLines = 2
    label.baselineAdjustment = .alignCenters
    label.textColor = AppColors.repoDetails.descriptionLabelTextColor
    headerView.addSubview(label)
    return label
  }()

  private lazy var starView: RepoDetailsStatView = {
    let starView = RepoDetailsStatView()
    starView.image.value = #imageLiteral(resourceName: "star")
    starView.title.value = "Stars"
    return starView
  }()

  private lazy var forkView: RepoDetailsStatView = {
    let forkView = RepoDetailsStatView()
    forkView.image.value = #imageLiteral(resourceName: "fork")
    forkView.title.value = "Forks"
    return forkView
  }()

  private lazy var issuesView: RepoDetailsStatView = {
    let issuesView = RepoDetailsStatView()
    issuesView.image.value = #imageLiteral(resourceName: "issue")
    issuesView.title.value = "Issues"
    return issuesView
  }()

  private lazy var watchersView: RepoDetailsStatView = {
    let watchersView = RepoDetailsStatView()
    watchersView.image.value = #imageLiteral(resourceName: "watcher")
    watchersView.title.value = "Watchers"
    return watchersView
  }()

  private lazy var statStackView: UIStackView = {
    let statStackView = UIStackView()
    statStackView.axis = .horizontal
    statStackView.distribution = .fillEqually
    statStackView.backgroundColor = .white
    statStackView.spacing = 10
    view.addSubview(statStackView)
    return statStackView
  }()

  private lazy var goToGithubButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Go to GitHub", for: .normal)
    view.addSubview(button)
    return button
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
    setupStatStackView()
    setupConstraints()
    setupBinding()
  }

  func setupView() {
    navigationBarView.attachToTop(of: view)
    navigationBarView.isBackButtonVisible.value = true
    navigationBarView.isSearchButtonVisible.value = false
    view.backgroundColor = AppColors.global.backgroundColor
  }

  func setupStatStackView() {
    statStackView.addArrangedSubview(issuesView)
    statStackView.addArrangedSubview(starView)
    statStackView.addArrangedSubview(forkView)
    statStackView.addArrangedSubview(watchersView)
  }

  func setupBinding() {
    navigationBarView.backButton.reactive.pressed = CocoaAction(viewModel.inputs.dismiss)
    viewModel.inputs.isVisible <~ isVisible
    goToGithubButton.reactive.pressed = CocoaAction(viewModel.inputs.goToGitHub)

    loadingView.reactive.isHidden <~ viewModel.outputs.isLoading.negate()

    let nonNilModel = viewModel.outputs.repository.producer.skipNil()
    titleLabel.reactive.text <~ nonNilModel.map(\.name)
    descriptionLabel.reactive.text <~ nonNilModel.map(\.description)
    starView.reactive.number <~ nonNilModel.map(\.starsCount)
    forkView.reactive.number <~ nonNilModel.map(\.forksCount)
    issuesView.reactive.number <~ nonNilModel.map(\.issuesCount)
    watchersView.reactive.number <~ nonNilModel.map(\.watchersCount)
  }
}

private extension RepoDetailsViewController {
  func setupConstraints() {
    setupHeaderViewConstraints()
    setupTitleLabelConstraints()
    setupDescriptionLabelConstraints()
    setupStatStackViewConstraints()
    setupGoToGitHubButtonConstrains()
    setupLoadingViewConstraints()
  }

  func setupHeaderViewConstraints() {
    headerView.apply {
      $0.topConstraint(onBottomOf: navigationBarView, constant: 1)
      $0.leadingConstraint(constant: 0)
      $0.trailingConstaint(constant: 0)
      $0.heightConstraint(constant: 160)
    }
  }

  func setupTitleLabelConstraints() {
    titleLabel.apply {
      $0.topConstraint(constant: 20)
      $0.leadingConstraint(constant: 20)
      $0.trailingConstaint(constant: -20)
    }
  }

  func setupDescriptionLabelConstraints() {
    descriptionLabel.apply {
      $0.topConstraint(constant: 20)
      $0.leadingConstraint(constant: 20)
      $0.trailingConstaint(constant: -20)
      $0.bottomConstraint(constant: -20)
    }
  }

  func setupStatStackViewConstraints() {
    statStackView.apply {
      $0.topConstraint(onBottomOf: headerView, constant: 30)
      $0.leadingConstraint(constant: 25)
      $0.trailingConstaint(constant: -25)
      $0.heightConstraint(constant: 60)
    }
  }

  func setupGoToGitHubButtonConstrains() {
    goToGithubButton.apply {
      $0.centerToParentHorizontal()
      $0.topConstraint(onBottomOf: statStackView, constant: 30)
      $0.widthConstraint(constant: 120)
      $0.heightConstraint(constant: 40)
    }
  }

  func setupLoadingViewConstraints() {
    loadingView.apply {
      $0.stickToParentEdges()
    }
  }
}
