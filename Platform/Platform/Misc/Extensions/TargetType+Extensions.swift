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
}
