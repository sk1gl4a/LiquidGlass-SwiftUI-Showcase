import SwiftUI

struct GlassNavigationView: View {
    @State private var searchText = ""

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                ZStack {
                    BackgroundView()
                    Text("Home")
                        .font(.largeTitle.bold())
                }
                .environment(\.colorScheme, .dark)
            }

            Tab("Explore", systemImage: "safari") {
                ZStack {
                    BackgroundView()
                    VStack(spacing: 16) {
                        Image(systemName: "safari")
                            .font(.system(size: 56))
                            .foregroundStyle(.secondary)
                        Text("Explore")
                            .font(.largeTitle.bold())
                    }
                }
                .environment(\.colorScheme, .dark)
            }

            Tab("Favorites", systemImage: "heart.fill") {
                ZStack {
                    BackgroundView()
                    Text("Favorites")
                        .font(.largeTitle.bold())
                }
                .environment(\.colorScheme, .dark)
            }

            Tab(role: .search) {
                ZStack {
                    BackgroundView()
                    Text("Search")
                        .font(.largeTitle.bold())
                }
                .environment(\.colorScheme, .dark)
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabBarMinimizeBehavior(.onScrollDown)
        .searchable(text: $searchText, prompt: "Search")
    }
}
