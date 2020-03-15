import UIKit
import RxSwift

open class Controller<ControllerScene: View,
                      ControllerViewModel: ViewModel,
                      ControllerCoordinator: Coordinator>: UIViewController {

    public let disposeBag = DisposeBag()
    public var scene: ControllerScene { view as! ControllerScene }
    public let viewModel: ControllerViewModel
    public var coordinator: ControllerCoordinator?

    public init(viewModel: ControllerViewModel, coordinator: ControllerCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("You need to implement init?(coder)")
    }

    open override func loadView() {
        setupView()
        willBind()
        useViewModel()
        didBind()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        debugPrint("🚩 ControllerAppeared: " + String(describing: type(of: self)))
    }

    private func setupView() {
        self.view = ControllerScene()
        scene.setup()
    }

    private func useViewModel() {
        guard let viewModelInput = viewModelInput else {
            return
        }

        bind(viewModelOutput: viewModel.transform(viewModelInput))
    }

    open var viewModelInput: ControllerViewModel.Input? { nil }
    open func bind(viewModelOutput: ControllerViewModel.Output) { }
    open func willBind() { }
    open func didBind() { }
}
