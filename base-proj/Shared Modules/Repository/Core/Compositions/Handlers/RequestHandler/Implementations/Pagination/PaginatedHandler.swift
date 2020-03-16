import Foundation
import RxSwift
import Moya

final class PaginatedHandler<Model: Decodable>: DefaultRequestHandler {

  let pageSize: Int
  private(set) var pages = [[Model]]()
  private var meta: PaginationMeta?
  private let metaPath: String

  var nextPage: Int {
    return pages.count + 1
  }

  var list: [Model] {
    pages.flatMap {$0}
  }

  var paginationCompleted: Bool {
    self.list.count >= (meta?.numberOfItems ?? Int.max)
  }

  var observableList: Observable<[Model]> {
    Observable.of(list)
  }

  var observableEventList: Observable<Event<[Model]>> {
    return Observable.of(.next(list))
  }

  init(errorHandler: ErrorHandler = ApiErrorHandler(),
       parseHandler: ParseHandler = CodableParseHandler(),
       at keyPath:   String?      = nil,
       metaPath:     String       = "meta",
       pageSize:     Int          = 10) {
    self.pageSize = pageSize
    self.metaPath = metaPath
    super.init(errorHandler: errorHandler, parseHandler: parseHandler, at: keyPath)
  }
}

extension PaginatedHandler {
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
          self.meta = try self.parseHandler.parse(response, at: self.metaPath)
          page = try self.parseHandler.parse(response, at: self.keyPath)
        } catch let error {
          return .error(error)
        }

        if !page.isEmpty {
          self.pages.append(page)
        }

        if self.paginationCompleted {
          return .of(.next(self.list), .completed)
        }

        return .just(.next(self.list))
      }
  }
}
