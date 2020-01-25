//
//  Event.swift
//  Domain
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

public struct Event: Identifiable {
  public typealias Identifier = IdentifierOf<Event>
  public typealias RawIdentifier = String

  public let id: Identifier
  public let type: EventType
  public let actor: EventActor
  public let repo: EventRepositroy
}
