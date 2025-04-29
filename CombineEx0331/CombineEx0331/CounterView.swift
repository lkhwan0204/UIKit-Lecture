import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    @Published var count = 0
}

struct CounterView: View {
    @ObservedObject var viewModel: CounterViewModel
    
    var body: some View {
        VStack {
            Text("Counter: \(viewModel.count)").font(.title)
            
            HStack {
                Button("증가") {
                    viewModel.count += 1
                }
                .padding()
                Button("감소") {
                    viewModel.count -= 1
                }
            }
        }
    }
}

#Preview {
    CounterView(viewModel: CounterViewModel())
}
