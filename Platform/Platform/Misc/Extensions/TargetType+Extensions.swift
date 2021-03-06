//
//  TargetType+Extensions.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Moya

extension TargetType {
  func sampleData(from sample: Any, file: String = #file, line: Int = #line) -> Data {
    guard let data = try? JSONSerialization.data(withJSONObject: sample) else {
      fatalError("Unable to convert sample data in \(file) at line \(line)")
    }

    return data
  }

  var apiBaseURL: URL {
    let baseUrlString = "https://api.github.com"
    return URL(string: baseUrlString)!
  }

  func requestHeaders(token: String = "") -> [String: String] {
    var headers =  [
      "Accept": "application/json",
      "Content-type": "application/json"
    ]

    if token != "" {
      headers["Authorization"] = "Bearer \(token)"
    }
    return headers
  }
}
