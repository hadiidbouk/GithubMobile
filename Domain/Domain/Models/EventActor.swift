//
//  Actor.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public struct EventActor: Identifiable {
  public typealias Identifier = IdentifierOf<EventActor>
  public typealias RawIdentifier = Int
  
  public let id: Identifier
  public let username: String
  public let displayName: String
  public let url: String
  public let avatarUrl: String
}
