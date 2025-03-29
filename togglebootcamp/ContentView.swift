import SwiftUI

struct ContentView: View {
    @State private var isToggleOn: Bool = false
    @State var selection: String = "1"
    @State private var volume: Double = 50.0
    
    
    let options = [1, 2, 3, 4, 5]
    
    @State private var selectedOption = 1
    
    var body: some View {
        VStack {
            Text("Toggle is: \(isToggleOn ? "On" : "Off")")
                .padding(.bottom)
            //toggleの機能
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
            
            VStack(alignment: .leading) {
                
                //Pickerの機能
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
            }
            .padding(.horizontal, 100)
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}

#Preview {
    ContentView()
}
