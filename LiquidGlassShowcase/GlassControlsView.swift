import SwiftUI

struct GlassControlsView: View {
    @State private var isOn = true
    @State private var sliderValue: Double = 0.5
    @State private var stepperValue = 3
    @State private var selectedSegment = 0
    @State private var pickerSelection = "Option A"

    private let pickerOptions = ["Option A", "Option B", "Option C"]

    var body: some View {
        ScrollView {
                VStack(spacing: 32) {
                    Text("Controls")
                        .font(.largeTitle.bold())
                        .padding(.top, 60)

                    // MARK: - Toggle
                    SectionLabel("Toggle")
                    Toggle("Liquid Glass", isOn: $isOn)
                        .tint(.blue)
                        .padding()
                        .glassEffect(.regular)

                    // MARK: - Slider
                    SectionLabel("Slider")
                    Slider(value: $sliderValue) {
                        Text("Value")
                    } minimumValueLabel: {
                        Image(systemName: "speaker.fill")
                    } maximumValueLabel: {
                        Image(systemName: "speaker.wave.3.fill")
                    }
                    .tint(.blue)
                    .padding()
                    .glassEffect(.regular)

                    // MARK: - Stepper
                    SectionLabel("Stepper")
                    Stepper("Count: \(stepperValue)", value: $stepperValue, in: 0...10)
                        .padding()
                        .glassEffect(.regular)

                    // MARK: - Segmented Picker
                    SectionLabel("Segmented Picker")
                    Picker("Segment", selection: $selectedSegment) {
                        Text("First").tag(0)
                        Text("Second").tag(1)
                        Text("Third").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .glassEffect(.regular)

                    // MARK: - Menu Picker
                    SectionLabel("Menu Picker")
                    Picker("Choose", selection: $pickerSelection) {
                        ForEach(pickerOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    .pickerStyle(.menu)
                    .padding()
                    .glassEffect(.regular)

                    Spacer(minLength: 60)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
        }
        .environment(\.colorScheme, .dark)
        .background { BackgroundView() }
        .navigationTitle("Controls")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct SectionLabel: View {
    let title: String
    init(_ title: String) { self.title = title }

    var body: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 4)
    }
}
