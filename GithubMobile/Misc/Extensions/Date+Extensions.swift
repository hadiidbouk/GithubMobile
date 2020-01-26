//
//  Date+Extensions.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

extension Date {
  var timeAgo: String {
    let fromDate = self
    let toDate = Date()

    if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0  {
      return interval == 1 ? "\(interval)" + " " + "year ago" : "\(interval)" + " " + "years ago"
    }

    if let interval = Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month, interval > 0  {
      return interval == 1 ? "\(interval)" + " " + "month ago" : "\(interval)" + " " + "months ago"
    }

    if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0  {
      return interval == 1 ? "\(interval)" + " " + "day ago" : "\(interval)" + " " + "days ago"
    }

    if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour, interval > 0 {
      return interval == 1 ? "\(interval)" + " " + "hour ago" : "\(interval)" + " " + "hours ago"
    }

    if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute, interval > 0 {
      return interval == 1 ? "\(interval)" + " " + "minute ago" : "\(interval)" + " " + "minutes ago"
    }

    return "a moment ago"
  }

  static func randomDate(range: Int) -> Date {
    let interval =  Date().timeIntervalSince1970
    let intervalRange = Double(86_400 * range)
    let random = Double(arc4random_uniform(UInt32(intervalRange)) + 1)
    let newInterval = interval + (random - (intervalRange / 2.0))
    return Date(timeIntervalSince1970: newInterval)
  }
}
