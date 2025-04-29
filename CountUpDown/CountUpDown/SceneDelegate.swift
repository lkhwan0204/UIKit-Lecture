//
//  SceneDelegate.swift
//  CountUpDown
//
//  Created by kyuhyeon Lee on 3/11/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {     //함수 선언
        guard let windowScene = (scene as? UIWindowScene) else { return }   //scene 객체를 uiwindowscene 타입으로 안전하게 캐스팅, 캐스팅이란 데이터 타입을 다른 데이터 타입으로 바꾸는것!
        window = UIWindow(windowScene: windowScene)     //화면에 앱 콘텐츠를 표시할 수 있는 새로운 uiwindow 객체를 만든다.
        window?.rootViewController = ViewController()       //window가 화면에 표시할 첫번째 화면을 지정한다.(앱을 실행하면 viewcontroller 클래스가 첫화면으로 나옴)
        window?.makeKeyAndVisible()     //window를 화면에 보이게 하고, 사용자 입력을 받을 수 있는 주요한 상태로 설정.
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

