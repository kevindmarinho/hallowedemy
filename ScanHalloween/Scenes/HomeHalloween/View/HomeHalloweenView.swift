//
//  ContentView.swift
//  ScanHalloween
//
//  Created by kevin marinho on 11/10/22.
//

import SwiftUI
import CodeScanner

struct HomeHalloweenView: View {
    @State var isPresentingScanner = false
    @State var isPresentingModal = false
    @State var scannedCode: String = "Fantasma off, tente scanear de novo"
    @State var codeWasScanned = false
    
    var scannerSheet: some View {
        VStack{
            
            Image("teia")
                .resizable()
                .frame(width: 100, height: 150)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            CodeScannerView(
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result{
                        self.scannedCode = code.string
                        self.isPresentingScanner = false
                        self.codeWasScanned = true
                    }
                }
                
            )
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.backgroundYellow, lineWidth: 5)
            )
            .frame(width: 300, height: 400, alignment: .center)
            
            Image("ghost-lado")
                .resizable()
                .frame(width: 125, height: 175)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Spacer()
        }
        .onDisappear(){
            if codeWasScanned{
                self.isPresentingModal = true
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        
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
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 26)
                    .padding(.bottom, 23)
                
                Image("ghost")
                    .resizable()
                    .frame(width: 220.5, height: 252)
                    .padding(.bottom, 35)
                VStack{
                    Button{
                        self.isPresentingScanner = true
                    }label:{
                        Text("Escanear QR Code")
                            .bold()
                            .padding(.vertical, 25)
                            .frame(maxWidth: .infinity)
                            .background(Color.backgroundYellow)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .padding(.horizontal, 25)
                    }
                    
//                    NavigationLink(destination: ARDisplayView()) {
//                        HStack{
//                            Text("Ele está aqui")
//                                .bold()
//                                .padding(.vertical, 25)
//                                .frame(maxWidth: .infinity)
//                                .background(Color.backgroundYellow)
//                                .foregroundColor(.white)
//                                .cornerRadius(40)
//                                .padding(.horizontal, 25)
//                            
//                        }
//                    }.padding(.bottom, 30)
                    
                    
                }
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
            .sheet(isPresented: $isPresentingModal){
                self.modal
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    
    var modal: some View{
        ZStack{
            Color.background.ignoresSafeArea()
            Text(scannedCode)
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.horizontal, 26)
                .padding(.bottom, 23)
        }
    }
}

struct HomeHalloweenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHalloweenView()
    }
}
