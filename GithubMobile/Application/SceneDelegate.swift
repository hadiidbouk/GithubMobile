//
//  SceneDelegate.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import OAuthSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  private var appCoordinator: AppCoordinator?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.windowScene = windowScene
    appCoordinator = AppCoordinator(window: window!)
    appCoordinator?.start()
  }

  func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    guard let url = URLContexts.first?.url else {
      return
    }
    let authConfig = AuthConfig()
    if (url.absoluteString.starts(with: authConfig.redirectUri)) {
      OAuthSwift.handle(url: url)
    }
  }
}

