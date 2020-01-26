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
  }

  func setupCellContentViewConstraints() {
    cellContentView.apply {
      $0.leadingConstraint(constant: 15)
      $0.trailingConstaint(constant: -15)
      $0.topConstraint(constant: 15)
      $0.bottomConstraint(constant: 0)
    }
  }
}
