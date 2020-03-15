import Foundation
import Moya

public protocol ParseHandler {
    func parse<Model: Decodable>(_ response: Response, at keyPath: String?) throws -> Model
}
