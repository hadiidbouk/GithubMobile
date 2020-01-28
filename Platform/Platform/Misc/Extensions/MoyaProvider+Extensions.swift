//
//  MoyaProvider+Extensions.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Moya
import ReactiveSwift

extension MoyaProvider {
  func defaultRequest<T: Decodable>(_ target: Target, of responseType: T.Type) -> SignalProducer<T, Error> {
    return baseDefaultRequest(target, of: responseType).mapError { $0 as Error }
  }

  func defaultRequest(_ target: Target) -> SignalProducer<Never, Error> {
    return baseDefaultRequest(target).mapError { $0 as Error }
  }
}

extension MoyaProvider {
  func baseDefaultRequest<T: Decodable>(_ target: Target, of responseType: T.Type) -> SignalProducer<T, MoyaError> {
    return reactive.request(target).filterSuccessfulStatusCodes().map(responseType, using: MoyaProvider.defaultDecoder())
  }

  func baseDefaultRequest(_ target: Target) -> SignalProducer<Never, MoyaError> {
    return reactive.request(target).filterSuccessfulStatusCodes().then(SignalProducer<Never, MoyaError>.empty)
  }
}

extension MoyaProvider {
  static func defaultDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return decoder
  }
}
