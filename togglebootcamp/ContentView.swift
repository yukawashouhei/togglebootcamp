import SwiftUI

struct ContentView: View {
    @State private var isToggleOn: Bool = false
    @State var selection: String = "1" //未使用
    
    let options = [1, 2, 3, 4, 5] // Picker の選択肢を定義
    
    @State private var selectedOption = 1 // 選択された Picker の値を保持
    
    var body: some View {
        VStack {
            Text("Toggle is: \(isToggleOn ? "On" : "Off")")
                .padding(.bottom)
            
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
            Spacer()
            
            VStack(alignment: .leading) {
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
                
                Spacer()
            }
            .padding(.horizontal, 100)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    ContentView()
}
