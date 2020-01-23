//
//  Apply.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/24/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

protocol HasApply { }

extension HasApply {
  func apply(closure: (Self) -> ()) {
      closure(self)
  }
}

extension UIView: HasApply { }
