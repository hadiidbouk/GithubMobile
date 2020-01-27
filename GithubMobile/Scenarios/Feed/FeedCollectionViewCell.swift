//
//  FeedCell.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import ReactiveSwift

class FeedCollectionViewCell: UICollectionViewCell {

  private lazy var cellContentView: UIView = {
    let view = UIView()
    view.backgroundColor = AppColors.feed.cellBackgroundColor
    view.layer.borderColor = AppColors.feed.cellBorderColor.cgColor
    view.layer.borderWidth = 1
    view.layer.masksToBounds = false
    view.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
    view.layer.shadowColor = AppColors.feed.cellShadowColor.cgColor
    view.layer.shadowOpacity = 0.2
    contentView.addSubview(view)
    return view
  }()

  private lazy var avatarImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.roundedCorners(15)
    imageView.contentMode = .scaleAspectFit
    cellContentView.addSubview(imageView)
    return imageView
  }()

  private lazy var usernameLabel: UILabel = {
    let label = UILabel()
    label.textColor = AppColors.feed.cellUsernameLabelTextColor
    label.font = UIFont.systemFont(ofSize: 13)
    cellContentView.addSubview(label)
    return label
  }()

  private lazy var timeAgoLabel: UILabel = {
    let label = UILabel()
    label.text = Date.randomDate(range: 2).timeAgo
    label.textColor = AppColors.feed.cellTimeAgoLabelTextColor
    label.font = UIFont.systemFont(ofSize: 13)
    cellContentView.addSubview(label)
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.textColor = AppColors.feed.cellDescriptionLabelTextColor
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 15)
    label.adjustsFontSizeToFitWidth = true
    label.baselineAdjustment = .alignCenters
    cellContentView.addSubview(label)
    return label
  }()

  private var model: MutableProperty<FeedSectionModel?> = MutableProperty(nil)

  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(with model: FeedSectionModel) {
    self.model.value = model
  }
}

private extension FeedCollectionViewCell {
  func setup() {
    setupView()
    setupConstraints()
    setupBindings()
  }

  func setupView() {
    contentView.backgroundColor = .clear
  }

  func setupBindings() {
    let nonNilModel = model.producer.skipNil()
    usernameLabel.reactive.text <~ nonNilModel.map(\.actorName)
    timeAgoLabel.reactive.text <~ nonNilModel.map(\.createdAt.timeAgo)
    descriptionLabel.reactive.attributedText <~ nonNilModel.map(\.description)
    avatarImageView.reactive.imageWithPlaceholder <~ nonNilModel.map { ($0.avatarUrl, #imageLiteral(resourceName: "avatar_placeholder")) }
  }
}

// MARK: - Constraints
private extension FeedCollectionViewCell {
  func setupConstraints() {
    setupCellContentViewConstraints()
    setupAvatarImageViewConstraints()
    setupUsernameLabelConstraints()
    setupTimeAgoLabelConstraints()
    setupDescriptionLabelConstraints()
  }

  func setupCellContentViewConstraints() {
    cellContentView.apply {
      $0.leadingConstraint(constant: 15)
      $0.trailingConstaint(constant: -15)
      $0.topConstraint(constant: 15)
      $0.bottomConstraint(constant: 0)
    }
  }

  func setupAvatarImageViewConstraints() {
    avatarImageView.apply {
      $0.topConstraint(constant: 15)
      $0.leadingConstraint(constant: 15)
      $0.widthConstraint(constant: 30)
      $0.heightConstraint(constant: 30)
    }
  }

  func setupUsernameLabelConstraints() {
    usernameLabel.apply {
      $0.leadingConstraint(onTrailingOf: avatarImageView, constant: 10)
      $0.centerVertical(dependingOn: avatarImageView)
    }
  }

  func setupTimeAgoLabelConstraints() {
    timeAgoLabel.apply {
      $0.centerVertical(dependingOn: usernameLabel)
      $0.trailingConstaint(constant: -15)
    }
  }

  func setupDescriptionLabelConstraints() {
    descriptionLabel.apply {
      $0.leadingConstraint(view: avatarImageView, constant: 0)
      $0.topConstraint(onBottomOf: avatarImageView, constant: 5)
      $0.bottomConstraint(constant: -5)
      $0.trailingConstaint(constant: -15)
    }
  }
}
