import SwiftUI

struct BackgroundExtensionView: View {
    @State private var showInspector = false

    var body: some View {
        NavigationSplitView {
            List {
                Section("Landscapes") {
                    ForEach(sampleItems, id: \.self) { item in
                        NavigationLink(item, value: item)
                    }
                }
            }
            .navigationTitle("Gallery")
        } detail: {
            ZStack {
                Image("BigSur")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .backgroundExtensionEffect()

                VStack(spacing: 24) {
                    Spacer()

                    Text("Background Extension")
                        .font(.largeTitle.bold())

                    Text("The .backgroundExtensionEffect() mirrors adjacent content under the sidebar, creating an edge-to-edge illusion with blur for legibility.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)

                    // MARK: - Scroll edge effect demo
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(0..<15) { index in
                                Text("Scrollable item \(index + 1)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .glassEffect(.regular)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .safeAreaBar(edge: .top) {
                        Text("Scroll Edge Effect")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                }
            }
            .environment(\.colorScheme, .dark)
        }
    }

    private var sampleItems: [String] {
        ["Big Sur", "Yosemite", "Sequoia", "Catalina", "Monterey", "Sonoma", "Ventura"]
    }
}
