import Foundation

protocol ListPlayersPresenter {
    var viewModel: ListPlayersViewModel { get }
    func onAppear() async
}

struct ListPlayersPresenterImpl: ListPlayersPresenter {
    var viewModel: ListPlayersViewModel
    let useCase: FetchPlayersUseCase
    
    init(
        viewModel: ListPlayersViewModel,
        useCase: FetchPlayersUseCase
    ) {
        self.viewModel = viewModel
        self.useCase = useCase
    }
    
    @MainActor
    func onAppear() async {
        viewModel.isLoading = true
        do {
            let model = try await useCase.execute()
            let playersDescriptor = model.map {
                PlayerDescriptor(
                    id: $0.id,
                    displayName: "\($0.givenName) \($0.surname)",
                    imageURL: $0.imageURL
                )
            }
            viewModel.descriptor = ListPlayerDescriptor(players: playersDescriptor)
        } catch {
            // Handle error case
        }
        viewModel.isLoading = false
    }
}
