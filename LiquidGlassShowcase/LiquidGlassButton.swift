import SwiftUI

struct LiquidGlassButton: View {
    let title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding()
                .glassEffect(.clear.interactive())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text(title))
    }
}
