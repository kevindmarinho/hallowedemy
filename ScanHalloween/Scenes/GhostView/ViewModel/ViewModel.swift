//
//  ViewModel.swift
//   Hallowedemy
//
//  Created by Gabriel de Oliveira Maciel on 12/10/22.
//

import Combine
import RealityKit

final class ViewModel: ObservableObject {
    static var shared = ViewModel()
    @Published var arView: ARView?
    @Published var enableAR = false
    @Published var xTranslation: Float = 0 {
        didSet {}
    }
    @Published var yTranslation: Float = 0 {
        didSet {}
    }
    @Published var zTranslation: Float = 0 {
        didSet {}
    }
    
    init(){
        arView = ARView(frame: .zero)
        
//        TODO: Criar modelo 3D e passar como modelo
        
//        let boxAnchor = try?
        
//        arView?.scene.anchors.append(boxAnchor)
    }
    
    //TODO: Criar modelo 3D e passar como modelo no método
    func translateBox(){
        if let ghost = (arView.scene.anchors[0] as?  {
            
            let xTranslationM = ×Translation / 100
            let yTranslationM= yTranslation / 100
            let zTranslationM = zTranslation / 100
            
            let translation = SIMD3<Float>(xTranslationM,
                                           yTranslationM,
                                           zTranslationM)
            
            steelBox.transform.translation = translation
        }
    }
    
}
