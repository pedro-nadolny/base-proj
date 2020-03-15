import UIKit
import Core
import Home

final class AppCoordinator: Coordinator {

    var subCoordinators = [Coordinator]()
    let navigation = UINavigationController()
    private let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        startHome()
    }

    private func startHome() {
        let homeCoordinator: Coordinator = HomeCoordinator(presentingViewController: navigation,
                                                           assembler: HomeAssemblerImpl())
        subCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
}
