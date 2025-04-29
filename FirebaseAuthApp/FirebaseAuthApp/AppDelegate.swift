import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    // 앱 실행 시 Firebase를 초기화하고, 첫 화면을 LoginViewController로 설정합니다.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Firebase 초기화
        FirebaseApp.configure()

        // 기본 윈도우 및 초기 뷰 컨트롤러 설정
        window = UIWindow(frame: UIScreen.main.bounds)
        let loginVC = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
