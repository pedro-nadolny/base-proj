import Foundation

final class HomeRepositoryInjection: HomeReposiotoryDependencies {
    var listConverter: ListConverter { ListConverter() }
    var homeService: HomeService { HomeServiceImpl() }
}
