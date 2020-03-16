import UIKit

public protocol CodeView: View {
    func hierarchy()
    func constraints()
    func configurations()
}

public extension CodeView {
    func setup() {
        hierarchy()
        constraints()
        configurations()
    }
}

public typealias CodeScene = CodeView & UIView
