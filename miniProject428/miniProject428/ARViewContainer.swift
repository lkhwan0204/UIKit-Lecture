import SwiftUI
import ARKit
import SceneKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var selectedItem: String?
    
    func makeUIView(context: Context) -> ARSCNView {
        let sceneView = ARSCNView(frame: .zero)
        sceneView.delegate = context.coordinator
        sceneView.scene = SCNScene()
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        sceneView.session.run(configuration)
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
        return sceneView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {
        context.coordinator.selectedItem = selectedItem
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: ARViewContainer
        var selectedItem: String?
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        
        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            guard let sceneView = gesture.view as? ARSCNView else { return }
            let location = gesture.location(in: sceneView)

            guard let query = sceneView.raycastQuery(from: location, allowing: .existingPlaneGeometry, alignment: .horizontal),
                  let result = sceneView.session.raycast(query).first,
                  let item = selectedItem else { return }

            let position = SCNVector3(
                result.worldTransform.columns.3.x,
                result.worldTransform.columns.3.y + 0.05,
                result.worldTransform.columns.3.z
            )

            if item == "신발" || item == "자동차" || item == "머그컵" {
                guard let scene = SCNScene(named: "\(item).usdz") else { return }
                let objectNode = SCNNode()
                for child in scene.rootNode.childNodes {
                    objectNode.addChildNode(child)
                }
                objectNode.position = position
                objectNode.scale = SCNVector3(0.01, 0.01, 0.01)
                objectNode.pivot = SCNMatrix4Identity
                sceneView.scene.rootNode.addChildNode(objectNode)
            } else {
                let node = createNode(for: item)
                node.position = position
                sceneView.scene.rootNode.addChildNode(node)
            }
        }

        func createNode(for item: String) -> SCNNode {
            switch item {
            case "Cup":
                let geometry = SCNCylinder(radius: 0.05, height: 0.07)
                geometry.firstMaterial?.diffuse.contents = UIColor.white
                return SCNNode(geometry: geometry)
            case "Book":
                let geometry = SCNBox(width: 0.12, height: 0.02, length: 0.18, chamferRadius: 0)
                geometry.firstMaterial?.diffuse.contents = UIColor.brown
                return SCNNode(geometry: geometry)
            default:
                return SCNNode()
            }
        }
    }
}
