import Foundation

protocol PlayersRepository {
    func fetchPlayers() async throws -> [PlayerEntity]
}
