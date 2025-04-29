//
//  SceneDelegate.swift
//  UMC-ios_workbook
//
//  Created by kyuhyeon Lee on 3/11/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {return}
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = BaseViewController()
        self.window?.makeKeyAndVisible()
    }
}

