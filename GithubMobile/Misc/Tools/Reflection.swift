//
//  Reflection.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/24/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

protocol Reflection { }

extension Reflection {

  var className: String {
    let thisType = type(of: self)
    return String(describing: thisType)
  }

  static var className: String {
    let thisType = type(of: self)
    return String(describing: thisType)
  }
}
