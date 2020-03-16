import Foundation
import Moya
import RxMoya
import RxSwift

final class HomeServiceImpl: HomeService {

    let provider: MoyaProvider<HomeRouter>

    init(provider: MoyaProvider<HomeRouter> = .default) {
        self.provider = provider
    }

    func list() -> Observable<Response> {
        return provider.rx
            .request(.list)
            .asObservable()
    }
}
