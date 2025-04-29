//
//  ContentView.swift
//  ARkitEx
//
//  Created by kyuhyeon Lee on 4/25/25.
//

import SwiftUI

// SwiftUI 화면에 ARKit 뷰 연결
struct ContentView: View {
    var body: some View {
        VStack {
            Text("AR + VisionOS Demo")
                .font(.headline)
                .padding()

            ARVisionView()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

