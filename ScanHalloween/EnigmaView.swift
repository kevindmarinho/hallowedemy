////
////  EnigmaView.swift
////   Hallowedemy
////
////  Created by kevin marinho on 12/10/22.
////
//
//import SwiftUI
//import CodeScanner
//
//public var isPresentingScanner = false
//
//struct EnigmaView: View {
//  //  @State var isPresentingScanner = false
//   // @State var scannedCode: String = "Leia para tentar desvender o misterio"
//    
//    var scannerSheet : some View {
//        CodeScannerView(
//            codeTypes: [.qr],
//            completion: { result in
//                if case let .success(code) = result{
//                    scannedCode = code.string
//                    isPresentingScanner = false
//                }
//            }
//        )
//    }
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct EnigmaView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnigmaView()
//    }
//}
