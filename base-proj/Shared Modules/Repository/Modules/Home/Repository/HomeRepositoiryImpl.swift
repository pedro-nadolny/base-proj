import Foundation
import RxSwift
import Domain

final class HomeRepositoryImpl: HomeRepository {

    private let homeService: HomeService
    private let listConverter: ListConverter

    init(dependencies: HomeReposiotoryDependencies) {
        homeService = dependencies.homeService
        listConverter = dependencies.listConverter
    }

    public func list() -> Observable<Event<List>> {
        return homeService.list()
            .handle()
            .map(listConverter.convert)
    }
}
