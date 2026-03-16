import SwiftUI

struct CustomGlassEffectsView: View {
    var body: some View {
        ScrollView {
                VStack(spacing: 32) {
                    Text("Custom Effects")
                        .font(.largeTitle.bold())
                        .padding(.top, 60)

                    // MARK: - GlassEffectContainer
                    VStack(alignment: .leading, spacing: 12) {
                        Text("GlassEffectContainer")
                            .font(.headline)

                        Text("Combines multiple glass effects for optimized rendering and fluid morphing.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 4)

                    GlassEffectContainer {
                        VStack(spacing: 16) {
                            HStack(spacing: 12) {
                                GlassCard(icon: "sun.max.fill", label: "Weather")
                                GlassCard(icon: "music.note", label: "Music")
                                GlassCard(icon: "map.fill", label: "Maps")
                            }

                            HStack(spacing: 12) {
                                GlassCard(icon: "camera.fill", label: "Camera")
                                GlassCard(icon: "gear", label: "Settings")
                            }
                        }
                    }

                    // MARK: - Glass effect styles comparison
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Effect Styles")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 4)

                    GlassEffectContainer {
                        VStack(spacing: 16) {
                            Text(".clear")
                                .font(.title3)
                                .foregroundStyle(.primary)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .glassEffect(.clear)

                            Text(".regular")
                                .font(.title3)
                                .foregroundStyle(.primary)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .glassEffect(.regular)

                            Text(".clear.interactive()")
                                .font(.title3)
                                .foregroundStyle(.primary)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .glassEffect(.clear.interactive())

                            Text(".regular.interactive()")
                                .font(.title3)
                                .foregroundStyle(.primary)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .glassEffect(.regular.interactive())
                        }
                    }

                    Spacer(minLength: 60)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
        }
        .environment(\.colorScheme, .dark)
        .background { BackgroundView() }
        .navigationTitle("Custom Effects")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct GlassCard: View {
    let icon: String
    let label: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title)
            Text(label)
                .font(.caption)
        }
        .foregroundStyle(.primary)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .glassEffect(.regular.interactive())
    }
}
