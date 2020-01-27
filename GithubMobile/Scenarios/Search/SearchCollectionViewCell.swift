//
//  SearchCollectionViewCell.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import ReactiveSwift

class SearchCollectionViewCell: UICollectionViewCell {

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

  private lazy var bookImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "book")
    imageView.contentMode = .scaleAspectFit
    cellContentView.addSubview(imageView)
    return imageView
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.adjustsFontSizeToFitWidth = true
    label.baselineAdjustment = .alignCenters
    cellContentView.addSubview(label)
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 13)
    label.numberOfLines = 2
    label.baselineAdjustment = .alignCenters
    cellContentView.addSubview(label)
    return label
  }()

  private lazy var starImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "star")
    imageView.contentMode = .scaleAspectFit
    cellContentView.addSubview(imageView)
    return imageView
  }()

  private lazy var starsCountLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 13)
    label.text = "3"
    cellContentView.addSubview(label)
    return label
  }()

  private var model: MutableProperty<SearchSectionModel?> = MutableProperty(nil)

  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(with model: SearchSectionModel) {
    self.model.value = model
  }
}

private extension SearchCollectionViewCell {
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
    titleLabel.reactive.text <~ nonNilModel.map(\.name)
    descriptionLabel.reactive.text <~ nonNilModel.map(\.description)
    starsCountLabel.reactive.text <~ nonNilModel.map(\.stars.roundedWithAbbreviations)
  }
}

// MARK: - Constraints
private extension SearchCollectionViewCell {
  func setupConstraints() {
    setupCellContentViewConstraints()
    setupBookImageViewConstraints()
    setupTitleLabelConstraints()
    setupDescriptionLabelConstraints()
    setupStarImageViewConstraints()
    setupStarsCountLabelConstraints()
  }

  func setupCellContentViewConstraints() {
    cellContentView.apply {
      $0.leadingConstraint(constant: 15)
      $0.trailingConstaint(constant: -15)
      $0.topConstraint(constant: 15)
      $0.bottomConstraint(constant: 0)
    }
  }

  func setupBookImageViewConstraints() {
    bookImageView.apply {
      $0.leadingConstraint(constant: 15)
      $0.topConstraint(constant: 20)
      $0.widthConstraint(constant: 15)
      $0.heightConstraint(constant: 15)
    }
  }

  func setupTitleLabelConstraints() {
    titleLabel.apply {
      $0.leadingConstraint(onTrailingOf: bookImageView, constant: 10)
      $0.centerVertical(dependingOn: bookImageView)
      $0.trailingConstaint(constant: -40)
    }
  }

  func setupDescriptionLabelConstraints() {
    descriptionLabel.apply {
      $0.leadingConstraint(view: titleLabel, constant: 0)
      $0.topConstraint(onBottomOf: titleLabel, constant: 5)
      $0.trailingConstaint(constant: -5)
      $0.bottomConstraint(constant: -5)
    }
  }

  func setupStarImageViewConstraints() {
    starImageView.apply {
      $0.trailingConstaint(constant: -15)
      $0.centerVertical(dependingOn: titleLabel)
      $0.widthConstraint(constant: 15)
      $0.heightConstraint(constant: 15)
    }
  }

  func setupStarsCountLabelConstraints() {
    starsCountLabel.apply {
      $0.trailingConstaint(onLeadingOf: starImageView, constant: -5)
      $0.centerVertical(dependingOn: titleLabel)
    }
  }
}
