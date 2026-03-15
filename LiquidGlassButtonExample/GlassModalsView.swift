import SwiftUI

struct GlassModalsView: View {
    @State private var showSheet = false
    @State private var showConfirmation = false
    @State private var showPopover = false

    var body: some View {
        ScrollView {
                VStack(spacing: 32) {
                    Text("Sheets & Modals")
                        .font(.largeTitle.bold())
                        .padding(.top, 60)

                    Text("Sheets feature increased corner radius and inset half-sheets. Action sheets originate from source elements.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // MARK: - Sheet
                    Button("Present Sheet") {
                        showSheet = true
                    }
                    .buttonStyle(.glassProminent)
                    .controlSize(.large)
                    .sheet(isPresented: $showSheet) {
                        SheetContent()
                            .presentationDetents([.medium, .large])
                    }

                    // MARK: - Confirmation Dialog
                    Button("Show Action Sheet") {
                        showConfirmation = true
                    }
                    .buttonStyle(.glass)
                    .controlSize(.large)
                    .confirmationDialog(
                        "Choose an Action",
                        isPresented: $showConfirmation,
                        titleVisibility: .visible
                    ) {
                        Button("Share") {}
                        Button("Duplicate") {}
                        Button("Delete", role: .destructive) {}
                        Button("Cancel", role: .cancel) {}
                    }

                    // MARK: - Popover
                    Button("Show Popover") {
                        showPopover = true
                    }
                    .buttonStyle(.glass)
                    .controlSize(.large)
                    .popover(isPresented: $showPopover) {
                        VStack(spacing: 12) {
                            Text("Popover")
                                .font(.headline)
                            Text("Popovers adopt Liquid Glass backgrounds automatically.")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .frame(width: 260)
                    }

                    Spacer(minLength: 60)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
        }
        .environment(\.colorScheme, .dark)
        .background { BackgroundView() }
        .navigationTitle("Modals")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct SheetContent: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Image(systemName: "sparkles")
                    .font(.system(size: 48))
                    .foregroundStyle(.blue)

                Text("Liquid Glass Sheet")
                    .font(.title2.bold())

                Text("Half sheets are inset from the display edge, letting content peek through. When expanded to full height, the sheet becomes more opaque.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Button("Dismiss") {
                    dismiss()
                }
                .buttonStyle(.glass)
                .controlSize(.large)
            }
            .padding()
            .navigationTitle("Sheet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
