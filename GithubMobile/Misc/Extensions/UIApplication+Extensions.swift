//
//  UIApplication+Extensions.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

extension UIApplication {
  var topSafeArea: CGFloat {
    guard let window = windows.first else {
      return 0
    }
    return window.safeAreaInsets.top
  }

  var bottomSafeArea: CGFloat {
    guard let window = windows.first else {
      return 0
    }
    return window.safeAreaInsets.bottom
  }
}


