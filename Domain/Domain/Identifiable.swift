//
//  Identifiable.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public protocol Identifiable {
  associatedtype RawIdentifier: Comparable & Hashable = String
  associatedtype IdentifiedType: Identifiable

  var id: IdentifierOf<IdentifiedType> { get }
}

public struct IdentifierOf<Value: Identifiable>: RawRepresentable, Comparable, Hashable {
  public let rawValue: Value.RawIdentifier

  public init(rawValue: Value.RawIdentifier) {
    self.rawValue = rawValue
  }

  public init(_ value: Value.RawIdentifier) {
    self.init(rawValue: value)
  }

  public static func == (lhs: IdentifierOf<Value>, rhs: IdentifierOf<Value>) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  public static func < (lhs: IdentifierOf<Value>, rhs: IdentifierOf<Value>) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
}

extension IdentifierOf: ExpressibleByIntegerLiteral where Value.RawIdentifier == Int {
  public typealias IntegerLiteralType = Int

  public init(integerLiteral value: Int) {
    self.init(rawValue: value)
  }
}

extension IdentifierOf: ExpressibleByStringLiteral, ExpressibleByUnicodeScalarLiteral, ExpressibleByExtendedGraphemeClusterLiteral where Value.RawIdentifier == String {
  public typealias StringLiteralType = String
  public typealias UnicodeScalarLiteralType = String
  public typealias ExtendedGraphemeClusterLiteralType = String

  public init(stringLiteral value: String) {
    self.init(rawValue: value)
  }
}

extension IdentifierOf where Value.RawIdentifier == Int {
  public init(_ number: NSNumber) {
    self.init(rawValue: number.intValue)
  }
}

extension IdentifierOf: CustomStringConvertible where Value.RawIdentifier: CustomStringConvertible {
  public var description: String {
    return rawValue.description
  }
}
