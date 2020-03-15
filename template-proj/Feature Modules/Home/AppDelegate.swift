import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        let coordinator = HomeCoordinator(presentingViewController: vc, assembler: HomeAssemblerImpl())
        coordinator.start()
        return true
    }
}
