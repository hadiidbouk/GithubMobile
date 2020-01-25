//
//  AuthConfig.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/24/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Foundation

class AuthConfig {

  let clientId: String
  let clientSecret: String
  let redirectUri: String
  let scope: String
  let accessTokenUrl: String
  let authorizeUrl: String
  let responseType: String

  init(plistURL: URL? = nil) {
    var authConfigURL: URL?
    if plistURL == nil {
      guard let url = Bundle.main.url(forResource: "AuthConfig", withExtension: "plist", subdirectory: "") else {
        fatalError("Cannot find the auth config file.")
      }
      authConfigURL = url
    } else {
      authConfigURL = plistURL
    }

    guard let authConfigPath = authConfigURL?.path,
      let authConfigData = FileManager.default.contents(atPath: authConfigPath) else {
        fatalError("Cannot read the auth config file content.")
    }

    do {
      let authConfigObject = try PropertyListSerialization.propertyList(from: authConfigData,
                                                                        options: PropertyListSerialization.ReadOptions(),
                                                                        format: nil)
      guard let authConfigDict = authConfigObject as? Dictionary<String, AnyObject> else {
        fatalError("Wrong auth config plist content.")
      }

      clientId = authConfigDict["clientId"] as! String
      clientSecret = authConfigDict["clientSecret"] as! String
      redirectUri = authConfigDict["redirectUri"] as! String
      scope = authConfigDict["scope"] as! String
      accessTokenUrl = authConfigDict["accessTokenUrl"] as! String
      authorizeUrl = authConfigDict["authorizeUrl"] as! String
      responseType = authConfigDict["responseType"] as! String
    } catch {
      fatalError("Cannot get the properties from the auth config plist.")
    }
  }
}
