import Foundation

protocol FetchPlayersUseCase {
    func execute() async throws -> [PlayerEntity]
}

struct FetchPlayersUseCaseImpl: FetchPlayersUseCase {
    let repository: PlayersRepository
    
    func execute() async throws -> [PlayerEntity] {
        return try await repository.fetchPlayers()
    }
}
