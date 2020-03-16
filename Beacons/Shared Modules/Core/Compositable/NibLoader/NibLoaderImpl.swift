import UIKit

final class NibLoaderImpl: NibLoader {
    private let view: UIView

    init(view: UIView) {
        self.view = view
    }

    func load() {
        let metatype = type(of: view)
        let bundle = Bundle(for: metatype)
        bundle.loadNibNamed(metatype.description(), owner: view)
    }
}
