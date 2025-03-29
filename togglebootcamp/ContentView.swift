//
//  ContentView.swift
//  togglebootcamp
//
//  Created by 湯川昇平 on 2025/03/29.
//

import SwiftUI

struct ContentView: View {
    @State private var isToggleOn: Bool = false
    
    var body: some View {
        VStack {
            Text("Toggle is: \(isToggleOn ? "On" : "Off")")
                .padding(.bottom)
            
            VStack {
                
                HStack {
                    Text("Status:")
                    Text(isToggleOn ? "Online" : "Offline")}
                .font(.title)
                
                Toggle(isOn: $isToggleOn) {
                    Text("Toggle Label")
                }
                .tint(.purple)
            }
            Spacer()
        }
        .padding(.horizontal, 100)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}

#Preview {
    ContentView()
}
