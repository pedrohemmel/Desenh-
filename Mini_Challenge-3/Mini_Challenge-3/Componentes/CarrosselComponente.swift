//
//  CarrosseeComponente.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 23/03/23.
//

import SwiftUI

struct CarrosselComponente: View {
    @Binding var imagemEstaSelecionada: Bool
    @Binding var desenhoSelecionado: String
    @Binding var referenciaDesenhoSelecionado: String
    @Binding var categoriaDesenhos: String
    @Binding var desenhos: [Desenho]
    
    var nossosDesenhosViewModel: NossosDesenhosViewModel? = nil
    
    let larguraTela = UIScreen.main.bounds.size.width
    var body: some View {
        VStack {
            HStack {
                Text("\(categoriaDesenhos)")
                    .font(.custom("AveriaGruesaLibre-Regular", fixedSize: {
                        if UIDevice.current.userInterfaceIdiom == .phone {
                            return 25
                        } else {
                            return 50
                        }
                    }()))
                    .foregroundColor(.accentColor)
                    .padding(10)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                Spacer()
            }
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: [GridItem(.fixed(15))],
                    spacing: 15,
                    content: {
                    ForEach(desenhos, id: \.id) { desenho in
                        Button {
                            self.nossosDesenhosViewModel?.esconderTeclado()
                            self.desenhoSelecionado = desenho.nomeDiretorio
                            self.referenciaDesenhoSelecionado = "\(desenho.referenciaImagem)"
                            self.imagemEstaSelecionada = true
                        } label: {
                            Image("\(desenho.nomeDiretorioMiniatura)")
                                .resizable()
                                .frame(width: self.larguraTela * 0.2, height: self.larguraTela * 0.2)
                                .cornerRadius(10)
                                .clipped()
                                .shadow(color: Color.black.opacity(0.3), radius: 0.5, x: 2, y: 2)
                        }
                    }
                })
            }
            .frame(height: self.larguraTela * 0.2)
            .padding(.horizontal, 10)
        }
        
    }
}
