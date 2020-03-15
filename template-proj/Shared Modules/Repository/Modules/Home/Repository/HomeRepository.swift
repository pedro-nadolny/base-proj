import Foundation
import RxSwift
import Domain

public protocol HomeRepository {
    func list() -> Observable<Event<List>>
}
