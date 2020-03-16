import Foundation
import UIKit
import Core
import SnapKit

public final class HomeScene: CodeScene {

    public let tableView = UITableView()

    public func hierarchy() {
        addSubview(tableView)
    }

    public func constraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    public func configurations() {
        
    }
}
