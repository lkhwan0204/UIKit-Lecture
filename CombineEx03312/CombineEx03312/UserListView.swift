import SwiftUI
import Combine

struct User: Decodable,Identifiable {
    var id: Int
    var name: String
}

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    private var cancellables = Set<AnyCancellable>()
    
    func fetchUsers() {
        let url  = Url(string: )
    }
}
struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SwiftUIView()
}
