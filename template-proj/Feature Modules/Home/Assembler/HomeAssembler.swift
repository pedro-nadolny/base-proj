import UIKit
import Core
import Swinject

public protocol HomeAssembler {
    func homeController(coordinator: HomeCoordinator) -> UIViewController
}
