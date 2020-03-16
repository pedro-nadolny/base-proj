import Foundation
import RxSwift
import Moya

protocol RequestHandler {
  func handle<Model: Decodable>(response: Observable<Response>) -> Observable<Event<Model>>
  func handleVoid(response: Observable<Response>) -> Observable<Event<Void>>
}

extension RequestHandler {
  var successStatusRange: ClosedRange<Int> {
    return 200...299
  }
}
