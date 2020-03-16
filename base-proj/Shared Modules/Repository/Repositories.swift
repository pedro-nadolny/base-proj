public final class Repositories {
    public static func getHomeRepository() -> HomeRepository {
        HomeRepositoryImpl(dependencies: HomeRepositoryInjection())
    }
}
