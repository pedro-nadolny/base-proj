import Foundation
import RxSwift
import Moya

class DefaultRequestHandler: RequestHandler {

    let errorHandler: ErrorHandler
    let parseHandler: ParseHandler
    let keyPath: String?

    init(errorHandler: ErrorHandler = ApiErrorHandler(),
         parseHandler: ParseHandler = CodableParseHandler(),
         at keyPath: String? = nil) {
        self.errorHandler = errorHandler
        self.parseHandler = parseHandler
        self.keyPath = keyPath
    }

    func handle<Model>(response: Observable<Response>) -> Observable<Event<Model>> where Model: Decodable {
        return response
            .materialize()
            .map { [weak self] event -> Event<Model> in
                guard let self = self else { return .completed }

                guard let response = event.element else {
                    guard let error = event.error else { return .completed }

                    return .error(error)
                }

                guard self.successStatusRange ~= response.statusCode else {
                    return self.errorHandler.handleError(from: response)
                }

                let model: Model

                do {
                    model = try self.parseHandler.parse(response, at: self.keyPath)
                } catch let error {
                    return .error(error)
                }

                return .next(model)
        }
    }

    func handleVoid(response: Observable<Response>) -> Observable<Event<Void>> {
        return response
            .materialize()
            .map { event -> Event<Void> in
                guard let response = event.element else {
                    guard let error = event.error else { return .completed }

                    return .error(error)
                }

                if self.successStatusRange ~= response.statusCode {
                    return .next(())
                }

                return self.errorHandler.handleError(from: response)
        }
    }
}

extension DefaultRequestHandler {
    func handle(response: Observable<Response>) -> Observable<Event<Void>> {
        return handleVoid(response: response)
    }
}
