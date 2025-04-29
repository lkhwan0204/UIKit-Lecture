import SwiftUI
import SceneKit

struct ContentView: View {
    @State private var showPopup = false
    @State private var selectedItem: String? = nil
    @State private var popupScale: CGFloat = 0.5
    @State private var popupOpacity: Double = 0.0

    var body: some View {
        ZStack {
            ARViewContainer(selectedItem: $selectedItem)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()) {
                        if !showPopup {
                            popupScale = 1.0
                            popupOpacity = 1.0
                            showPopup = true
                        } else {
                            popupScale = 0.5
                            popupOpacity = 0.0
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                showPopup = false
                            }
                        }
                    }
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(20)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity)

            if showPopup {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            popupScale = 0.5
                            popupOpacity = 0.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            showPopup = false
                        }
                    }
                
                VStack {
                    ItemPickerPopup(selectedItem: $selectedItem, showPopup: $showPopup)
                        .frame(width: 280, height: 280)
                        .scaleEffect(popupScale)
                        .opacity(popupOpacity)
                        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: popupScale)
                }
                .transition(.scale)
            }
        }
    }

    // Helper function to create SCNNode for given item
    // Consider moving this function to ARViewContainer.swift later
    func createNode(for item: String) -> SCNNode {
        switch item {
        case "sneaker":
            let geometry = SCNBox(width: 0.2, height: 0.1, length: 0.3, chamferRadius: 0.02)
            geometry.firstMaterial?.diffuse.contents = UIColor.red
            return SCNNode(geometry: geometry)
        case "car":
            let geometry = SCNBox(width: 0.4, height: 0.1, length: 0.2, chamferRadius: 0.05)
            geometry.firstMaterial?.diffuse.contents = UIColor.blue
            return SCNNode(geometry: geometry)
        case "cup_3":
            let geometry = SCNCylinder(radius: 0.05, height: 0.1)
            geometry.firstMaterial?.diffuse.contents = UIColor.white
            return SCNNode(geometry: geometry)
        default:
            return SCNNode()
        }
    }
}
