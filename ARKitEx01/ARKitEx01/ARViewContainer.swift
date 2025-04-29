import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        // AR 세션 구성 (증강현실 세계 추적 구성)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal] // 평면 감지: 수평면 탐지 활성화
        arView.session.run(config)

        // 디버그 정보 표시 [특징 포인트 표시, 기원점 표시]
        arView.debugOptions = [.showFeaturePoints, .showWorldOrigin]

        // 3D 박스 생성 및 배치 (바닥 위에 파란 박스를 하나 만들어서 AR 화면에 띄운다.)
        // 수평면(바닥 같은 곳) 에 박스를 고정할 기준점
        let anchor = AnchorEntity(plane: .horizontal)
        // 크기 0.1m짜리 파란색 박스 3D 모델
        let box = ModelEntity(mesh: .generateBox(size: 0.1),
            materials: [SimpleMaterial(color: .blue, isMetallic: false)])
        anchor.addChild(box)
        // AR 화면(장면)에 추가해서 눈에 보이게 만든다.
        arView.scene.anchors.append(anchor)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
