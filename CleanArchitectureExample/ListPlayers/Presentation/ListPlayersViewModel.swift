import Foundation

final class ListPlayersViewModel: ObservableObject {
    @Published var descriptor: ListPlayerDescriptor
    @Published var isLoading: Bool
    
    init(
        descriptor: ListPlayerDescriptor,
        isLoading: Bool
    ) {
        self.descriptor = descriptor
        self.isLoading = isLoading
    }
}

struct ListPlayerDescriptor {
    let players: [PlayerDescriptor]
}

struct PlayerDescriptor: Identifiable {
    let id: UUID
    let displayName: String
    let imageURL: URL?
}
