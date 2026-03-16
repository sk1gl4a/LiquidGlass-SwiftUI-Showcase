import SwiftUI

struct BackgroundView: View {

    var body: some View {
        Image("BigSur")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            .ignoresSafeArea()
    }
}
