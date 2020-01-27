//
//  AppColors.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/24/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

struct AppColors {
  struct Login {
    static let contentShadowColor = UIColor(hex: "#c2c2c2")
    static let contentBorderColor = UIColor(hex: "#d6d6d6")
    static let contentBackgroundColor = UIColor(hex: "#ffffff")
    static let loginButtonBackgroundColor = UIColor(hex: "#333333")
    static let titleTextColor = UIColor.darkText
    static let loginButtonTextColor = UIColor.white
  }

  struct Feed {
    static let cellShadowColor = UIColor(hex: "#c2c2c2")
    static let cellBorderColor = UIColor(hex: "#d6d6d6")
    static let cellBackgroundColor = UIColor(hex: "#ffffff")
    static let cellUsernameLabelTextColor = UIColor(hex: "#C4B464")
    static let cellTimeAgoLabelTextColor = UIColor(hex: "#5B5A55")
    static let cellDescriptionLabelTextColor = UIColor(hex: "#000000")
  }

  struct Shared {
    static let backgroundColor = UIColor(hex: "#ececec")
    static let dividerColor = UIColor(hex: "#d5d5d5")
    static let navigationBarBackgroundColor = UIColor(hex: "#fdf9f3")
    static let navigationBarShadowColor = UIColor(hex: "#595959")
  }
}
