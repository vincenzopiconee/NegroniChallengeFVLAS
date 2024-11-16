import SwiftUI

struct WardrobeSection: View {
    let title: String
    let items: [Item]
    @Binding var selection: Item?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(items) { item in
                        ProfileItem(item: item)
                            .onTapGesture {
                                handleSelection(for: item)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 17)
                                    .stroke(selection == item ? Color.black : Color.clear, lineWidth: 3)
                            )
                    }
                }
                .padding()
            }
        }
    }
    
    private func handleSelection(for item: Item) {
        if selection == item {
            selection = nil
        } else {
            selection = item
        }
    }
}

#Preview {
    WardrobeSection(title: "Masks", items: [Item(imageName: "exampleImage", name: "Example Item", category: .mask)], selection: .constant(nil))
}
