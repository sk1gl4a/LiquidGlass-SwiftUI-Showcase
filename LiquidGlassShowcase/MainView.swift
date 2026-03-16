import SwiftUI

struct MainView: View {
    @Namespace private var namespace
    @State private var path = NavigationPath()
    @State private var showBackButton = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            // Subtle glow behind the title
            RadialGradient(
                colors: [Color.white.opacity(0.06), .clear],
                center: .top,
                startRadius: 0,
                endRadius: 380
            )
            .ignoresSafeArea()
            .allowsHitTesting(false)

            NavigationStack(path: $path) {
                ScrollView {
                    VStack(spacing: 0) {
                        VStack(spacing: 8) {
                            Text("Liquid Glass")
                                .font(.system(size: 52, weight: .bold, design: .rounded))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.white, Color(white: 0.6)],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .padding(.top, 72)

                            Text("iOS 26 Showcase")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.bottom, 48)

                        VStack(spacing: 12) {
                            ForEach(showcaseItems) { item in
                                NavigationLink(value: item.destination) {
                                    Text(item.title)
                                        .font(.headline)
                                        .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(.glass)
                                .controlSize(.large)
                                .matchedTransitionSource(id: item.destination, in: namespace)
                            }
                        }
                        .padding(.horizontal, 24)

                        Spacer(minLength: 60)
                    }
                    .frame(maxWidth: .infinity)
                }
                .background(.black)
                .toolbar(.hidden, for: .navigationBar)
                .navigationDestination(for: ShowcaseDestination.self) { destination in
                    destinationView(for: destination)
                }
            }

            // Back button outside NavigationStack — doesn't participate in zoom,
            // no scroll conflict. Visibility driven independently from navigation.
            Button {
                path.removeLast()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.body.weight(.semibold))
                    .padding(12)
                    .glassEffect(.regular.interactive(), in: Circle())
            }
            .buttonStyle(.plain)
            .padding(.top, 52)
            .padding(.leading, 16)
            .opacity(showBackButton ? 1 : 0)
            .allowsHitTesting(showBackButton)
            .animation(.easeOut(duration: 0.15), value: showBackButton)
        }
        .background(.black)
        .environment(\.colorScheme, .dark)
        .onChange(of: path.isEmpty) { _, isEmpty in
            if isEmpty {
                showBackButton = false
            } else {
                Task {
                    try? await Task.sleep(for: .seconds(0.38))
                    showBackButton = true
                }
            }
        }
    }

    @ViewBuilder
    private func destinationView(for destination: ShowcaseDestination) -> some View {
        switch destination {
        case .buttonStyles:
            GlassButtonStylesView()
                .toolbar(.hidden, for: .navigationBar)
                .navigationTransition(.zoom(sourceID: destination, in: namespace))
        case .controls:
            GlassControlsView()
                .toolbar(.hidden, for: .navigationBar)
                .navigationTransition(.zoom(sourceID: destination, in: namespace))
        case .customEffects:
            CustomGlassEffectsView()
                .toolbar(.hidden, for: .navigationBar)
                .navigationTransition(.zoom(sourceID: destination, in: namespace))
        case .navigation:
            GlassNavigationView()
                .toolbar(.hidden, for: .navigationBar)
                .navigationTransition(.zoom(sourceID: destination, in: namespace))
        case .modals:
            GlassModalsView()
                .toolbar(.hidden, for: .navigationBar)
                .navigationTransition(.zoom(sourceID: destination, in: namespace))
        }
    }

    private var showcaseItems: [ShowcaseItem] {
        [
            ShowcaseItem(title: "Button Styles",   destination: .buttonStyles),
            ShowcaseItem(title: "Controls",        destination: .controls),
            ShowcaseItem(title: "Custom Effects",  destination: .customEffects),
            ShowcaseItem(title: "Navigation",      destination: .navigation),
            ShowcaseItem(title: "Sheets & Modals", destination: .modals),
        ]
    }
}

enum ShowcaseDestination: Hashable {
    case buttonStyles, controls, customEffects, navigation, modals
}

private struct ShowcaseItem: Identifiable {
    let id = UUID()
    let title: String
    let destination: ShowcaseDestination
}
