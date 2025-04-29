import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Firebase 초기화
        FirebaseApp.configure()

        // 초기 화면을 LoginViewController로 설정
        window = UIWindow(frame: UIScreen.main.bounds)
        let loginVC = LoginViewController()
        window?.rootViewController = UINavigationController(rootViewController: loginVC)
        window?.makeKeyAndVisible()

        return true
    }
}
