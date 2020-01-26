//
//  SceneDelegate.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/23/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import OAuthSwift
import XCGLogger

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  private var appCoordinator: AppCoordinator?
  private var logger: XCGLogger?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    logger = defaultLogger()
    logger?.debug("will connect to session...")

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.windowScene = windowScene
    appCoordinator = AppCoordinator(window: window!, logger: logger)
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

  func defaultLogger() -> XCGLogger {
    let options: (level: XCGLogger.Level, shouldLogToConsole: Bool)

    #if DEBUG
    options = (level: .debug, shouldLogToConsole: true)
    #else
    options = (level: .error, shouldLogToConsole: false)
    #endif

    let logger = XCGLogger(identifier: "com.hadiidbouk.GithubMobile.log", includeDefaultDestinations: false)
    if options.shouldLogToConsole {
      let consoleDestination = ConsoleDestination(identifier: XCGLogger.Constants.baseConsoleDestinationIdentifier)
      logger.add(destination: consoleDestination)
    }

    logger.setup(level: options.level, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, showDate: true)
    return logger
  }
}

