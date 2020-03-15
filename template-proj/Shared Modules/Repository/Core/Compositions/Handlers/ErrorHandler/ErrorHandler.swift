import Foundation
import RxSwift
import Moya

public protocol ErrorHandler {
    func handleError<Model>(from response: Response) -> Event<Model>
}
