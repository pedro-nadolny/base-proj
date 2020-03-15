import UIKit

public protocol XibView: View {}

extension XibView {
    func setup() {
        let nibLoader: NibLoader = NibLoaderImpl(view: self)
        nibLoader.load()
    }
}

public typealias XibScene = XibView & UIView
