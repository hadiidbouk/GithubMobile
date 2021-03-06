//
//  RepoDetailsStatView.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import ReactiveSwift

class RepoDetailsStatView: UIView {
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = AppColors.repoDetails.statTitleLabelTextColor
    label.font = UIFont.systemFont(ofSize: 12)
    label.textAlignment = .center
    return label
  }()

  fileprivate lazy var numberLabel: UILabel = {
    let label = UILabel()
    label.textColor = AppColors.repoDetails.statNumberLabelTextColor
    label.font = UIFont.boldSystemFont(ofSize: 13)
    return label
  }()

  private lazy var imageAndNumberStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fill
    stackView.alignment = .trailing
    return stackView
  }()

  private lazy var rootStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    addSubview(stackView)
    return stackView
  }()

  let image = MutableProperty<UIImage>(#imageLiteral(resourceName: "avatar_placeholder"))
  let title = MutableProperty<String>("")

  init() {
    super.init(frame: .zero)

    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension RepoDetailsStatView {
  func setup() {
    setupView()
    setupImageAndNumberStackView()
    setupRootStackView()
    setupBindings()
    setupConstraints()
  }

  func setupView() {
    backgroundColor = .white
    layer.borderColor = AppColors.global.borderColor.cgColor
    layer.borderWidth = 1
    layer.masksToBounds = false
    layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
    layer.shadowColor = AppColors.global.shadowColor.cgColor
    layer.cornerRadius = 15
    layer.shadowOpacity = 0.2
  }

  func setupImageAndNumberStackView() {
    imageAndNumberStackView.addArrangedSubview(numberLabel)
    imageAndNumberStackView.addArrangedSubview(imageView)
  }

  func setupRootStackView() {
    rootStackView.addArrangedSubview(titleLabel)
    rootStackView.addArrangedSubview(imageAndNumberStackView)
  }

  func setupBindings() {
    titleLabel.reactive.text <~ title
    imageView.reactive.image <~ image
  }
}

// MARK: - Constraints
private extension RepoDetailsStatView {
  func setupConstraints() {
    setupRootStackViewConstraints()
    setupImageViewConstraints()
  }

  func setupRootStackViewConstraints() {
    rootStackView.apply {
      $0.topConstraint(constant: 10)
      $0.leadingConstraint(constant: 8)
      $0.trailingConstaint(constant: -8)
      $0.bottomConstraint(constant: -5)
    }
  }

  func setupImageViewConstraints() {
    imageView.apply {
      $0.widthConstraint(constant: 15)
      $0.heightConstraint(constant: 15)
    }
  }
}

extension Reactive where Base: RepoDetailsStatView {
  var number: BindingTarget<Int> {
    return makeBindingTarget { base, number in
      base.numberLabel.text = number.roundedWithAbbreviations
    }
  }
}
