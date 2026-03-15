import SwiftUI

struct GlassButtonStylesView: View {
    var body: some View {
        ScrollView {
                VStack(spacing: 32) {
                    Text("Button Styles")
                        .font(.largeTitle.bold())
                        .padding(.top, 60)

                    // MARK: - .glass style
                    SectionHeader(title: ".glass")
                    HStack {
                        Button("Glass Button") {}
                            .buttonStyle(.glass)
                            .controlSize(.large)
                    }

                    // MARK: - .glassProminent style
                    SectionHeader(title: ".glassProminent")
                    HStack {
                        Button("Prominent Glass") {}
                            .buttonStyle(.glassProminent)
                            .controlSize(.large)
                    }

                    // MARK: - .glass with tint
                    SectionHeader(title: ".glass + tint")
                    HStack {
                        Button("Tinted Glass") {}
                            .buttonStyle(.glass)
                            .tint(.blue)
                            .controlSize(.large)
                    }

                    // MARK: - Custom .glassEffect
                    SectionHeader(title: ".glassEffect(.clear)")
                    HStack {
                        Button {} label: {
                            Text("Custom Glass Effect")
                                .font(.title3)
                                .foregroundStyle(.primary)
                                .padding()
                                .glassEffect(.clear.interactive())
                        }
                        .buttonStyle(.plain)
                    }

                    // MARK: - .glassEffect(.regular)
                    SectionHeader(title: ".glassEffect(.regular)")
                    HStack {
                        Button {} label: {
                            Text("Regular Glass Effect")
                                .font(.title3)
                                .foregroundStyle(.primary)
                                .padding()
                                .glassEffect(.regular.interactive())
                        }
                        .buttonStyle(.plain)
                    }

                    // MARK: - Extra large control size
                    SectionHeader(title: ".controlSize(.extraLarge)")
                    HStack {
                        Button("Extra Large") {}
                            .buttonStyle(.glass)
                            .controlSize(.extraLarge)
                    }

                    // MARK: - Button group in container
                    SectionHeader(title: "GlassEffectContainer")
                    GlassEffectContainer {
                        HStack(spacing: 16) {
                            Button {} label: {
                                Image(systemName: "play.fill")
                                    .font(.title2)
                                    .foregroundStyle(.primary)
                                    .padding()
                                    .glassEffect(.clear.interactive())
                            }
                            .buttonStyle(.plain)

                            Button {} label: {
                                Image(systemName: "forward.fill")
                                    .font(.title2)
                                    .foregroundStyle(.primary)
                                    .padding()
                                    .glassEffect(.clear.interactive())
                            }
                            .buttonStyle(.plain)

                            Button {} label: {
                                Image(systemName: "heart.fill")
                                    .font(.title2)
                                    .foregroundStyle(.primary)
                                    .padding()
                                    .glassEffect(.clear.interactive())
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    Spacer(minLength: 60)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
        }
        .environment(\.colorScheme, .dark)
        .background { BackgroundView() }
        .navigationTitle("Button Styles")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct SectionHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 4)
    }
}
