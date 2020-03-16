import Foundation
import RxSwift
import Moya

protocol HomeService {
    func list() -> Observable<Response>
}
