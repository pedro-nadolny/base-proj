import UIKit
import Core
import Components
import RxSwift
import RxCocoa

final class HomeController: Controller<HomeScene, HomeViewModel, HomeCoordinator>  {

    override var viewModelInput: HomeViewModel.Input? {
        HomeViewModel.Input()
    }

    override func willBind() {
        scene.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func bind(viewModelOutput: HomeViewModel.Output) {
        viewModelOutput.list.drive(scene.tableView.rx.items(cellIdentifier: "cell")) { _, text, cell in
            cell.textLabel?.text = text
        }.disposed(by: disposeBag)
    }
}
