//
//  SearchRepositoryResultResponse.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain

struct SearchRepositoryResultResponse: Decodable {
  let totalCount: Int
  let items: [Repository]

  private enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case items
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.totalCount = try container.decode(Int.self, forKey: .totalCount)
    self.items = try container.decode([Repository].self, forKey: .items)
  }
}

extension SearchRepositoryResultResponse {
  struct Repository: Decodable {
    public let id: SearchRepositoryResult.Repository.Identifier
    public let fullName: String
    public let stars: Int
    public let description: String

    private enum CodingKeys: String, CodingKey {
      case id
      case fullName = "full_name"
      case stars = "watchers"
      case description
    }

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try container.decode(SearchRepositoryResult.Repository.Identifier.self, forKey: .id)
      self.fullName = try container.decode(String.self, forKey: .fullName)
      self.stars = try container.decode(Int.self, forKey: .stars)
      self.description = try container.decode(String.self, forKey: .description)
    }
  }
}
