//
//  GhostView.swift
//   Hallowedemy
//
//  Created by Gabriel de Oliveira Maciel on 12/10/22.
//

import SwiftUI
import RealityKit

struct GhostView: View {
    var body: some View {
        return ARDisplayView().edgesIgnoringSafeArea(.all)
    }
}

struct ARDisplayView: UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> ARView {
        guard let arView = ViewModel.shared.arView else {
            print("Error while unwrapping arView from ViewModel!")
        }
        return arView
    }
}

struct GhostView_Previews: PreviewProvider {
    static var previews: some View {
        GhostView()
    }
}
