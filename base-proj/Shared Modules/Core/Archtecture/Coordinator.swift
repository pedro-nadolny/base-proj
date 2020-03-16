import UIKit

public protocol Coordinator {
    func start()
    var subCoordinators: [Coordinator] { get set }
    var navigation: UINavigationController { get }
}
