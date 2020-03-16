import Foundation
import Moya

public enum HomeRouter {
    case list
}

extension HomeRouter: TargetType {
    public var baseURL: URL {
        return URL(string: "http://www.google.com")!
    }

    public var path: String {
        ""
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Task {
        .requestPlain
    }

    public var headers: [String : String]? { nil }
}
