import SwiftUI

@main
struct CleanArchitectureExampleApp: App {
    var body: some Scene {
        WindowGroup {
            let presenter = ListPlayersPresenterImpl(
                viewModel: ListPlayersViewModel(
                    descriptor: ListPlayerDescriptor(players: []),
                    isLoading: false
                ),
                useCase: UseCaseFactory.makeFetchPlayersUseCase()
            )
            NavigationStack {
                ListPlayersView(presenter: presenter)
            }
        }
    }
}
