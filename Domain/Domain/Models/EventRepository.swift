//
//  Repository.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public struct EventRepositroy: Identifiable {
  public typealias Identifier = IdentifierOf<EventRepositroy>
  public typealias RawIdentifier = Int

  public let id: Identifier
  public let name: String
  public let url: String
}
