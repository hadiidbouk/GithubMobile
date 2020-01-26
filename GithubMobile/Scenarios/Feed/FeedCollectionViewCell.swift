//
//  FeedCell.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {

  private lazy var cellContentView: UIView = {
    let view = UIView()
    view.backgroundColor = AppColors.Feed.cellBackgroundColor
    view.layer.borderColor = AppColors.Feed.cellBorderColor.cgColor
    view.layer.borderWidth = 1
    view.layer.masksToBounds = false
    view.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
    view.layer.shadowColor = AppColors.Feed.cellShadowColor.cgColor
    view.layer.shadowOpacity = 0.2
    contentView.addSubview(view)
    return view
  }()

  private lazy var avatarImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "avatar_placeholder")
    imageView.roundedCorners(10)
    imageView.contentMode = .scaleAspectFit
    cellContentView.addSubview(imageView)
    return imageView
  }()

  private lazy var usernameLabel: UILabel = {
    let label = UILabel()
    label.text = "hadiidbouk"
    label.textColor = AppColors.Feed.cellUsernameLabelTextColor
    label.font = UIFont.systemFont(ofSize: 13)
    cellContentView.addSubview(label)
    return label
  }()

  private lazy var timeAgoLabel: UILabel = {
    let label = UILabel()
    label.text = Date.randomDate(range: 2).timeAgo
    label.textColor = AppColors.Feed.cellTimeAgoLabelTextColor
    label.font = UIFont.systemFont(ofSize: 13)
    cellContentView.addSubview(label)
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Starred abeade/fcm-push-pliugin Starred abeade/fcm-push-pliugin Starred abeade/fcm-push-pliugin Starred abeade/fcm-push-pliugin"
    label.textColor = AppColors.Feed.cellDescriptionLabelTextColor
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 15)
    label.adjustsFontSizeToFitWidth = true
    label.baselineAdjustment = .alignCenters
    cellContentView.addSubview(label)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension FeedCollectionViewCell {
  func setup() {
    setupView()
    setupConstraints()
  }

  func setupView() {
    contentView.backgroundColor = .clear
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
