//
//  ghostView.swift
//   Hallowedemy
//
//  Created by kevin marinho on 11/10/22.
//

import SwiftUI
import ARKit


struct ARView: UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let sceneView = ARSCNView()
        sceneView.showsStatistics = true
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        return sceneView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct ghostView: View {
    var body: some View {
        ARView()
    }
}

struct ghostView_Previews: PreviewProvider {
    static var previews: some View {
        ghostView()
    }
}
