import Foundation
import RxSwift
import Moya
import Domain

public final class ApiErrorHandler: ErrorHandler {

    private let defaultMessage: String

    public init(defaultMessage: String = "Something unexpected happend. :(") {
        self.defaultMessage = defaultMessage
    }

    public func handleError<Model>(from response: Response) -> Event<Model> {
        let error: Error

        do {
            let errorDto = try response.map(ErrorDTO.self)
            error = Error(message: errorDto.message, status: errorDto.status ?? 500)
        } catch _ {
            error = Error(message: defaultMessage, status: 500)
        }

        return Event.error(error)
    }
}
