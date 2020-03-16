import Foundation
import Core
import RxSwift
import RxCocoa
import Repository
import RxSwiftExt
import Domain

final class HomeViewModel: ViewModel {

    let homeRepository: HomeRepository

    init(homeRepository: HomeRepository = Repositories.getHomeRepository()) {
        self.homeRepository = homeRepository
    }

    struct Input {

    }

    struct Output {
        let list: Driver<[String]>
    }

    public func transform(_ input: Input) -> Output {
        return Output(list: list)
    }

    private var list: Driver<[String]> {
        return homeRepository.list()
            .elements()
            .map { $0.list }
            .asDriver(onErrorJustReturn: [])
    }
}
