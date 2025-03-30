import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    
    var id: String { self.rawValue }
    var description: String { self.rawValue.capitalized }
}

struct ContentView: View {
    @State private var isToggleOn: Bool = false
    @State var selection: String = "1"
    @State private var volume: Double = 50.0
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var backgroundColor: Color = .green
    
    let options = [1, 2, 3, 4, 5]
    
    @State private var selectedOption = 1
    
    var body: some View {
        VStack {
            Text("Toggle is: \(isToggleOn ? "On" : "Off")")
                .padding(.bottom)
            
            // toggleの機能
            VStack {
                HStack {
                    Text("Status:")
                    Text(isToggleOn ? "Online" : "Offline")
                }
                .font(.title)
                
                Toggle(isOn: $isToggleOn) {
                    Text("Toggle Label")
                }
                .tint(.purple)
            }
            .padding(.horizontal, 100)
            
            VStack(alignment: .leading) { // ここに閉じ括弧を追加
                
                // Pickerの機能
                Text("Custom Style")
                    .font(.headline)
                
                Picker(
                    selection: $selectedOption,
                    label: Text("Custom Options")
                ) {
                    ForEach(options, id: \.self) { option in
                        Text("\(option)").tag(option)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 100)
                
                Slider(value: $volume,
                       in: 0...100,
                       minimumValueLabel: Image(systemName: "speaker"),
                       maximumValueLabel: Image(systemName: "speaker.wave.3"),
                       label: {
                    Text("Volume")
                }
                )
                
                Form { // Form を VStack の中に移動
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { flavor in
                            Text(flavor.description)
                                .tag(flavor)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            } // VStack(alignment: .leading) の閉じ括弧
            .padding(.horizontal, 100)
            .frame(maxWidth: .infinity)
            Spacer()
            
            ZStack { // ZStack を VStack の中に移動
                Color.red
                    .edgesIgnoringSafeArea(.all)
                
                ColorPicker(
                    "Select a color",
                    selection: $backgroundColor,
                    supportsOpacity: true // supportsOpacity に引数を渡す
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}

#Preview {
    ContentView()
}
