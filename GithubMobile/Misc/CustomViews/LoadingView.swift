//
//  LoadingView.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

class LoadingView: UIView {

  private lazy var indicatorView: UIActivityIndicatorView = {
    let indicatorView = UIActivityIndicatorView()
    indicatorView.transform = CGAffineTransform(scaleX: 3, y: 3)
    indicatorView.color = .white
    overlayView.addSubview(indicatorView)
    return indicatorView
  }()

  private lazy var overlayView: UIView = {
    let overlayView = UIView()
    overlayView.backgroundColor = .lightGray
    overlayView.alpha = 0.6
    addSubview(overlayView)
    return overlayView
  }()

  init() {
    super.init(frame: .zero)

    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension LoadingView {
  func setup() {
    indicatorView.startAnimating()
    setupConstraints()
  }
}

// MARK: - Constraints
private extension LoadingView {
  func setupConstraints() {
    setupOverlayConstraints()
    setupIndicatorViewConstraints()
  }

  func setupOverlayConstraints() {
    overlayView.apply {
      $0.stickToParentEdges()
    }
  }

  func setupIndicatorViewConstraints() {
    indicatorView.apply {
      $0.centerToParentVertical()
      $0.centerToParentHorizontal()
    }
  }
}
