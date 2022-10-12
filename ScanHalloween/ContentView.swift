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
    @State var isPresentingModal = false
    @State var scannedCode: String = "Fantasma off, tente scanear de novo"
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result{
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                    self.isPresentingModal = true
                }
            }
        )
    }
    var body: some View {
        
        ZStack{
            
            Image("backgroundInicio")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

          
            VStack{
                ZStack{
                    Image("teia")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Image("title")
                        .padding(.top, 94)
                    Spacer()
                }
                .padding(.bottom, 36.48)
               
                Text("Escaneie os QR codes espalhados pelo lab e desvende os enigmas propostos. Lembre-se de explorar todo o ambiente e tenha uma experiência horripilante.")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 26)
                    .padding(.bottom, 23)
                
                Image("ghost")
                    .resizable()
                    .frame(width: 220.5, height: 252)
                    .padding(.bottom, 62)
                
                Button{
                    self.isPresentingScanner = true
                }label:{
                    Text("Escanear QR Code")
                        .bold()
                        .padding(.vertical, 25)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .padding(.horizontal, 25)
                }
                
                Spacer()
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
            .sheet(isPresented: $isPresentingModal){
                self.modal
            }
        }
    }
    
    var modal: some View{
        ZStack{
            Color.cyan
            Text(scannedCode)
        }
    }
}

extension Color{
    
    static let background = Color("ColorBackground")
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScanHalloween()
    }
}
