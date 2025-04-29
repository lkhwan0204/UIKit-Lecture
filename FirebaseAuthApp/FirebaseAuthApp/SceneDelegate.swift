import UIKit
import FirebaseCore

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    // scene이 연결될 때 초기 설정을 수행하는 메서드
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        // scene이 UIWindowScene 타입인지 확인
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Firebase 초기화 중복 방지 (만약 AppDelegate에서 호출하지 않았다면 여기서 호출)
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }

        // 새로운 UIWindow 인스턴스를 생성하여 windowScene에 연결
        window = UIWindow(windowScene: windowScene)

        // LoginViewController를 네비게이션 컨트롤러에 담아 루트 뷰 컨트롤러로 설정
        let loginVC = LoginViewController()
        let navController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navController

        // 윈도우를 보이도록 설정
        window?.makeKeyAndVisible()
    }

    // 나머지 SceneDelegate 메서드들은 기본 템플릿 코드를 그대로 사용
}
