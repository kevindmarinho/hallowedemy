//
//  ContentView.swift
//  ScanHalloween
//
//  Created by kevin marinho on 11/10/22.
//

import SwiftUI
import CodeScanner

struct ScanHalloween: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Leia para tentar desvender o misterio"
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result{
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    var body: some View {
        VStack{
            Text(scannedCode)
            
            Button("Leia essa parada ai"){
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScanHalloween()
    }
}
