import Foundation
import Moya

public final class CodableParseHandler: ParseHandler {
    
    public init() {}
    
    public func parse<Model>(_ response: Response, at keyPath: String? = nil) throws -> Model where Model: Decodable {
        return try response.map(Model.self, atKeyPath: keyPath)
    }
}
