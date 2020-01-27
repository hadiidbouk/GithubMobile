//
//  CachePolicyGettable.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Moya

protocol CachePolicyGettable {
  var cachePolicy: URLRequest.CachePolicy { get }
}

final class CachePolicyPlugin: PluginType {
  public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    if let cachePolicyGettable = target as? CachePolicyGettable {
      var mutableRequest = request
      mutableRequest.cachePolicy = cachePolicyGettable.cachePolicy
      return mutableRequest
    }
    return request
  }
}
