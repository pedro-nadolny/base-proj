import Foundation
import Moya

extension MoyaProvider {
  public static var `default`: MoyaProvider<Target> {
    return .with(plugins: NetworkLoggerPlugin())
  }

  public static func with(plugins: PluginType...) -> MoyaProvider<Target> {
    return MoyaProvider<Target>(stubClosure: MoyaProvider.immediatelyStub)
  }
}
