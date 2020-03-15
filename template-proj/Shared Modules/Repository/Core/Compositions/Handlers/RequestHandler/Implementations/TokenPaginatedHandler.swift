import Foundation
import RxSwift
import Moya

final class TokenPaginatedHandler<Model: Decodable>: DefaultRequestHandler {

  private(set) var pages = [[Model]]()
  private let tokenPath: String
  private var startedPaginating = false
  var nextPageToken: String?

  var list: [Model] {
    return pages.flatMap {$0}
  }

  var paginationCompleted: Bool {
    return nextPageToken == nil && startedPaginating
  }

  var observableList: Observable<[Model]> {
    return Observable.of(list)
  }

  var observableEventList: Observable<Event<[Model]>> {
    return Observable.of(.next(list))
  }

  init(errorHandler: ErrorHandler = ApiErrorHandler(),
       parseHandler: ParseHandler = CodableParseHandler(),
       at keyPath: String?        = nil,
       tokenAt tokenPath: String  = "next_page_token") {
    self.tokenPath = tokenPath
    super.init(errorHandler: errorHandler, parseHandler: parseHandler, at: keyPath)
  }
}

extension TokenPaginatedHandler {
  func handle(response: Observable<Response>) -> Observable<Event<[Model]>> {
    return response
      .materialize()
      .filter { !$0.isStopEvent }
      .flatMap { [weak self] event -> Observable<Event<[Model]>> in
        guard let self = self else { return .just(.completed) }
        guard let response = event.element else { return .just(.next(self.list)) }

        guard self.successStatusRange ~= response.statusCode else {
          return .just(self.errorHandler.handleError(from: response))
        }

        let page: [Model]

        do {
          page = try self.parseHandler.parse(response, at: self.keyPath)
        } catch {
          return .error(error)
        }

        self.nextPageToken = try? self.parseHandler.parse(response, at: self.tokenPath)

        if !page.isEmpty {
          self.pages.append(page)
        }

        self.startedPaginating = true
        return .just(.next(self.list))
      }
  }
}
