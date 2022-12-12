//
//  SceneDelegate.swift
//  DemoApp
//
//  Created by Kid Kid on 12/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        debugPrint("2. willConnectTo")
        
        let vc = MealsBuilder().buildMealListVC()
        let navVC = UINavigationController(rootViewController: vc)
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        debugPrint("2.1. sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        debugPrint("4. sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        debugPrint("1.1. sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        debugPrint("3. sceneWillEnterForeground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        debugPrint("1.2. sceneDidEnterBackground")
    }
}

