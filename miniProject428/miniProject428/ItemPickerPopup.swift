import SwiftUI

struct ItemPickerPopup: View {
    @Binding var selectedItem: String?
    @Binding var showPopup: Bool

    let items = ["연필", "컵", "책"]

    var body: some View {
        VStack(spacing: 20) {
            Text("사물을 선택하세요")
                .font(.headline)
            ForEach(items, id: \.self) { item in
                Button(action: {
                    selectedItem = item
                    withAnimation {
                        showPopup = false
                    }
                }) {
                    Text(item)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 10)
    }
}
