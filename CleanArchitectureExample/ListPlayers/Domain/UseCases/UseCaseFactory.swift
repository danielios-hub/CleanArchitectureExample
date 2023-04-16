import Foundation

public enum UseCaseFactory {
    static func makeFetchPlayersUseCase() -> FetchPlayersUseCase {
        FetchPlayersUseCaseImpl(
            repository: PlayersRepositoryImpl(
                networkDataSource: NetworkPlayersDataSourceImpl(
                    fetch: fetchStub
                )
            )
        )
    }
}
