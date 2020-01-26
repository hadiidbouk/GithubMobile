//
//  NavigationBarView.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

class NavigationBarView: UIView {

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
    backgroundColor = AppColors.Shared.navigationBarBackgroundColor
    layer.shadowColor = AppColors.Shared.navigationBarShadowColor.cgColor
    layer.masksToBounds = false
    layer.shadowOffset = CGSize(width: 0.0 , height: 1.0)
    layer.shadowOpacity = 1.0
    layer.shadowRadius = 1.0
  }
}
