import SwiftUI

struct ListPlayersView: View {
    let presenter: ListPlayersPresenter
    @ObservedObject var viewModel: ListPlayersViewModel
    
    init(presenter: ListPlayersPresenter) {
        self.presenter = presenter
        self.viewModel = presenter.viewModel
    }
    
    var body: some View {
        VStack {
            ForEach(viewModel.descriptor.players) { player in
                buildRow(player: player)
            }
            Spacer()
        }
        .task {
            await presenter.onAppear()
        }
        .padding(.all, 16)
        .navigationTitle("List Players")
    }
    
    private func buildRow(player: PlayerDescriptor) -> some View {
        HStack(spacing: 12) {
            if let url = player.imageURL {
                AsyncImage(url: url, content: { image in
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                }, placeholder: {
                    PlaceholderImage()
                })
            } else {
                PlaceholderImage()
            }
         
            Text(player.displayName)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .systemGray5))
        .cornerRadius(4)
    }
}

struct PlaceholderImage: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .frame(width: 40, height: 40)
        .background(Color.white)
    }
}
    
struct ListPlayersView_Previews: PreviewProvider {
    private struct Presenter: ListPlayersPresenter {
        var viewModel = ListPlayersViewModel(
            descriptor: ListPlayerDescriptor(
                players: .stub()
            ),
            isLoading: false
        )
        
        func onAppear() async {}
    }
    
    static var previews: some View {
        NavigationStack {
            ListPlayersView(presenter: Presenter())
        }
    }
}
