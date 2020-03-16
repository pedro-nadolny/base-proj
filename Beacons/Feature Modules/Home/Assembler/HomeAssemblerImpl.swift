import UIKit
import Core

public final class HomeAssemblerImpl: HomeAssembler {

    public init() {}

    public func homeController(coordinator: HomeCoordinator) -> UIViewController {
        return HomeController(viewModel: HomeViewModel(), coordinator: coordinator)
    }
}
