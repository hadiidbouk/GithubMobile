//
//  OAuthSwiftCredential+Extensions.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import OAuthSwift

extension OAuthSwiftCredential {
  func save() {
    let encoder = JSONEncoder()
    let encodedCredential = try? encoder.encode(self)
    UserDefaults.standard.set(encodedCredential, forKey: "githubMobile.login.credential")
  }

  static func load() -> OAuthSwiftCredential? {
    guard let credentialData = UserDefaults.standard.data(forKey: "githubMobile.login.credential") else {
      return nil
    }
    let decoder = JSONDecoder()
    let decodedCredential = try? decoder.decode(OAuthSwiftCredential.self, from: credentialData)
    return decodedCredential
  }
}
