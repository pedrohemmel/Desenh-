//
//  TesteTelaInicialView.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 21/03/23.
//

import SwiftUI

struct TelaInicialView: View {
    @State var imagemEstaSelecionada = false
    @State var dadosImagemSelecionada = Data()
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: EmptyView(), isActive: self.$imagemEstaSelecionada, label: {})
                VStack {
                    Text("Titulo")
                        .padding(.top, 60)
                    Spacer()
                    BotaoImportarImagemComponente(imagemEstaSelecionada: self.$imagemEstaSelecionada, dadosImagemSelecionada: self.$dadosImagemSelecionada)
                        .padding(.bottom, 40)
                    
                    BotaoMenuInicialComponente(destination: AnyView(NossosDesenhosView()), text: "Selecione um de nossos desenhos")
                        .padding(.bottom, 40)
                    BotaoMenuInicialComponente(destination: AnyView(EmptyView()), text: "Primeiro botão")
                    Spacer()
                    Spacer()
                }
            }
        }
        
        
    }
}
