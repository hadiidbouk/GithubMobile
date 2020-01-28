//
//  NavigationBarView.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import ReactiveSwift

class NavigationBarView: UIView {

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "GithubMobile"
    label.font = UIFont.boldSystemFont(ofSize: 14)
    addSubview(label)
    return label
  }()

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "avatar_placeholder")
    imageView.contentMode = .scaleAspectFit
    addSubview(imageView)
    return imageView
  }()

  lazy var searchButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(#imageLiteral(resourceName: "search"), for: .normal)
    button.setImage(#imageLiteral(resourceName: "search_highlighted"), for: .highlighted)
    button.imageView?.contentMode = .scaleAspectFit
    addSubview(button)
    return button
  }()

  lazy var backButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
    button.setImage(#imageLiteral(resourceName: "back_highlighted"), for: .highlighted)
    button.imageView?.contentMode = .scaleAspectFit
    addSubview(button)
    return button
  }()

  var isSearchButtonVisible = MutableProperty(true)
  var isBackButtonVisible = MutableProperty(false)

  init() {
    super.init(frame: .zero)

    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension NavigationBarView {
  func attachToTop(of view: UIView) {
    if !view.subviews.contains(self) {
      view.addSubview(self)
    }
    apply {
      $0.topConstraint(constant: 0)
                 $0.leadingConstraint(constant: 0)
                 $0.trailingConstaint(constant: 0)
                 $0.heightConstraint(constant: 44 + UIApplication.shared.topSafeArea)
    }
  }
}

private extension NavigationBarView {
  func setup() {
    setupView()
    setupConstraints()
    setupBindings()
  }

  func setupView() {
    backgroundColor = AppColors.global.navigationBarBackgroundColor
    layer.shadowColor = AppColors.global.navigationBarShadowColor.cgColor
    layer.masksToBounds = false
    layer.shadowOffset = CGSize(width: 0.0 , height: 1.0)
    layer.shadowOpacity = 1.0
    layer.shadowRadius = 1.0
  }

  func setupBindings() {
    searchButton.reactive.isHidden <~ isSearchButtonVisible.negate()
    backButton.reactive.isHidden <~ isBackButtonVisible.negate()
    titleLabel.reactive.isHidden <~ isBackButtonVisible
  }
}

// MARK: - Constraints
private extension NavigationBarView {
  func setupConstraints() {
    setupImageViewConstraints()
    setupTitleLabelConstraints()
    setupSearchButtonConstraints()
    setupBackButtonConstraints()
  }

  func setupImageViewConstraints() {
    imageView.centerToParentHorizontal()
    imageView.bottomConstraint(constant: -10)
    imageView.widthConstraint(constant: 25)
    imageView.heightConstraint(constant: 25)
  }

  func setupTitleLabelConstraints() {
    titleLabel.apply {
      $0.leadingConstraint(constant: 20)
      $0.centerVertical(dependingOn: imageView)
    }
  }

  func setupSearchButtonConstraints() {
    searchButton.apply {
      $0.trailingConstaint(constant: -20)
      $0.centerVertical(dependingOn: imageView)
      $0.widthConstraint(constant: 20)
      $0.heightConstraint(constant: 20)
    }
  }

  func setupBackButtonConstraints() {
    backButton.apply {
      $0.leadingConstraint(constant: 20)
      $0.centerVertical(dependingOn: imageView)
      $0.widthConstraint(constant: 20)
      $0.heightConstraint(constant: 20)
    }
  }
}

