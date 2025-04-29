import SwiftUI

struct ItemPickerPopup: View {
    @Binding var selectedItem: String?
    @Binding var showPopup: Bool

    let items = ["신발", "자동차", "머그컵"]

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
