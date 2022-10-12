//
//  GhostView.swift
//   Hallowedemy
//
//  Created by Gabriel de Oliveira Maciel on 12/10/22.
//

import ARKit
import SwiftUI
import RealityKit
import FocusEntity

struct ARDisplayView: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView()
        
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        arView.addSubview(coachingOverlay)
        
        context.coordinator.view = arView
        session.delegate = context.coordinator
        
        arView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        return arView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        weak var view: ARView?
        var focusEntity: FocusEntity?

        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let view = self.view else { return }
            debugPrint("Anchors added to the scene: ", anchors)
            self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
        }
        
        @objc func handleTap() {
            guard let view = self.view, let focusEntity = self.focusEntity else { return }

            let anchor = AnchorEntity()
            view.scene.anchors.append(anchor)

            let box = MeshResource.generateBox(size: 0.5, cornerRadius: 0.05)
            let material = SimpleMaterial(color: .blue, isMetallic: true)
            let diceEntity = ModelEntity(mesh: box, materials: [material])
            diceEntity.position = focusEntity.position

            anchor.addChild(diceEntity)
        }
    }
}

#if DEBUG
struct ARDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ARDisplayView()
    }
}
#endif
