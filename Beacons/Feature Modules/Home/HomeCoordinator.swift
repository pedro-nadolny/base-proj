import UIKit
import Core

public final class HomeCoordinator: Coordinator {
    private let presentingViewController: UIViewController
    private let assembler: HomeAssembler
    public var subCoordinators = [Coordinator]()
    public  let navigation = UINavigationController()

    public init(presentingViewController: UIViewController, assembler: HomeAssembler) {
        self.presentingViewController = presentingViewController
        self.assembler = assembler
    } 

    public func start() {
        let homeViewController = assembler.homeController(coordinator: self)
        navigation.setViewControllers([homeViewController], animated: false)
        navigation.modalPresentationStyle = .fullScreen
        homeViewController.modalPresentationStyle = .fullScreen
        presentingViewController.present(navigation, animated: false)
    }
}
