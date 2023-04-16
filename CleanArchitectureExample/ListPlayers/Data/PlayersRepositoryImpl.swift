import Foundation

struct PlayersRepositoryImpl: PlayersRepository {
    let networkDataSource: NetworkPlayersDataSource
    
    func fetchPlayers() async throws -> [PlayerEntity] {
        return try await networkDataSource
            .fetchPlayers()
            .map { player in
                PlayerEntity(
                    id: player.id,
                    givenName: player.playerName.firstName,
                    surname: player.playerName.lastName,
                    imageURL: player.image.flatMap(URL.init(string:))
                )
            }
    }
}
