import SwiftUI

struct GlassToolbarView: View {
    @State private var text = "Hello, Liquid Glass!"

    var body: some View {
        ScrollView {
                VStack(spacing: 20) {
                    Text("Toolbar")
                        .font(.largeTitle.bold())
                        .padding(.top, 60)

                    Text("Toolbar items adopt Liquid Glass with grouping support. Use icons for common actions and ToolbarSpacer for visual separation.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    TextEditor(text: $text)
                        .frame(height: 200)
                        .padding()
                        .glassEffect(.regular)

                    ForEach(0..<8) { index in
                        Text("Content row \(index + 1)")
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .glassEffect(.regular)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.bottom, 60)
        }
        .environment(\.colorScheme, .dark)
        .background { BackgroundView() }
        .navigationTitle("Toolbar")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {} label: { Image(systemName: "bold") }
            }
            ToolbarItem(placement: .bottomBar) {
                Button {} label: { Image(systemName: "italic") }
            }
            ToolbarItem(placement: .bottomBar) {
                Button {} label: { Image(systemName: "underline") }
            }
            ToolbarSpacer(.fixed, placement: .bottomBar)
            ToolbarItem(placement: .bottomBar) {
                Button {} label: { Image(systemName: "list.bullet") }
            }
            ToolbarItem(placement: .bottomBar) {
                Button {} label: { Image(systemName: "list.number") }
            }
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
            ToolbarItem(placement: .bottomBar) {
                Button {} label: { Image(systemName: "paperplane.fill") }
            }
        }
    }
}
