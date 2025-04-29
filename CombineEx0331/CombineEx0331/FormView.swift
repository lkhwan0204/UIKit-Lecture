import SwiftUI
import Combine

class FromViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValid = false
    
    private var cacellables: Set<AnyCancellable>()
    
    init() {
        publishers.CombineLatest($email, $password)
            .map { email, password in
                return !email.isEmpty && !password.count >= 6
            }
            .assign(to: \.isValid, on: self)
            .store(in: &cancellables)
    }
}

struct FromView: View {
    var body: some View{
        Text("")
    }
}

#Preview {
    FromView()
}
