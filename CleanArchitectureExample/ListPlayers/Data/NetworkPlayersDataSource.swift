import Foundation

protocol NetworkPlayersDataSource {
    func fetchPlayers() async throws -> [PlayerDTO]
}

struct NetworkPlayersDataSourceImpl: NetworkPlayersDataSource {
    var fetch: () async throws -> Data
    
    func fetchPlayers() async throws -> [PlayerDTO] {
        let response = try await fetch()
        return try JSONDecoder().decode([PlayerDTO].self, from: response)
    }
}

struct PlayerDTO: Decodable {
    struct PlayerName: Decodable {
        let firstName: String
        let lastName: String
    }
    
    let id: UUID
    let playerName: PlayerName
    let image: String?
}
