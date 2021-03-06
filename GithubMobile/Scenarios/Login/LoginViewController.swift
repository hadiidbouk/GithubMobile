//
//  ViewController.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class LoginViewController: BaseViewController {

  private lazy var contentView: UIView = {
    let contentView = UIView()
    contentView.backgroundColor = AppColors.login.loginButtonTextColor
    contentView.layer.borderColor = AppColors.global.borderColor.cgColor
    contentView.layer.borderWidth = 1
    contentView.layer.masksToBounds = false
    contentView.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
    contentView.layer.shadowColor = AppColors.global.shadowColor.cgColor
    contentView.layer.shadowOpacity = 0.2
    view.addSubview(contentView)
    return contentView
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "GitHubMobile"
    label.font = UIFont.boldSystemFont(ofSize: 30)
    label.textAlignment = .center
    label.textColor = AppColors.login.titleTextColor
    contentView.addSubview(label)
    return label
  }()

  private lazy var dividerView: UIView = {
    let dividerView = UIView()
    dividerView.backgroundColor = AppColors.global.dividerColor
    contentView.addSubview(dividerView)
    return dividerView
  }()

  private lazy var loginButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("Log in with GitHub", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = AppColors.login.loginButtonBackgroundColor
    button.roundedCorners(5)
    button.setImage(#imageLiteral(resourceName: "github_icon"), for: .normal)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    contentView.addSubview(button)
    return button
  }()

  private lazy var loadingView: LoadingView = {
    let loadingView = LoadingView()
    view.addSubview(loadingView)
    return loadingView
  }()

  private let viewModel: LoginViewModelType
  init(viewModel: LoginViewModelType) {
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

private extension LoginViewController {
  func setup() {
    setupView()
    setupConstraints()
    setupBindings()
  }

  func setupView() {
    view.backgroundColor = AppColors.global.backgroundColor
  }

  func setupBindings() {
    loginButton.reactive.pressed = CocoaAction(viewModel.inputs.login)
    loadingView.reactive.isHidden <~ viewModel.outputs.isLoading.negate()
  }
}

// MARK: - Constraints
private extension LoginViewController {
  func setupConstraints() {
    setupContentViewConstraints()
    setupTitleLabelConstraints()
    setupDividerViewConstraints()
    setupLoginButtonConstraints()
    setupLoadingViewConstraints()
  }

  func setupContentViewConstraints() {
    contentView.apply {
      $0.centerToParentVertical()
      $0.heightConstraint(constant: 280)
      $0.leadingConstraint(constant: 40)
      $0.trailingConstaint(constant: -40)
    }
  }

  func setupTitleLabelConstraints() {
    titleLabel.apply {
      $0.topConstraint(constant: 30)
      $0.leadingConstraint(constant: 0)
      $0.trailingConstaint(constant: 0)
    }
  }

  func setupDividerViewConstraints() {
    dividerView.apply {
      $0.heightConstraint(constant: 1)
      $0.leadingConstraint(constant: 40)
      $0.trailingConstaint(constant: -40)
      $0.topConstraint(onBottomOf: titleLabel, constant: 40)
    }
  }

  func setupLoginButtonConstraints() {
    loginButton.apply {
      $0.widthConstraint(constant: 220)
      $0.heightConstraint(constant: 40)
      $0.centerToParentHorizontal()
      $0.centerToParentVertical(constant: 30)
    }
  }

  func setupLoadingViewConstraints() {
    loadingView.apply {
      $0.stickToParentEdges()
    }
  }
}
