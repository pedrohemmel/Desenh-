//
//  DesenhosDePesquisaComponente.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 30/03/23.
//

import SwiftUI

struct DesenhosDePesquisaComponente: View {
    @Binding var textoPesquisa: String
    @Binding var desenhoSelecionado: String
    @Binding var imagemEstaSelecionada: Bool
    @Binding var categorias: [Categoria]
    
    @State var desenhosPesquisados = [Desenho]()
    
    var nossosDesenhosViewModel: NossosDesenhosViewModel? = nil
    
    let larguraTela = UIScreen.main.bounds.size.width
    let colunas = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            if desenhosPesquisados.isEmpty {
                Text("Título não encontrado")
                    .padding(.top, 40)
            } else {
                LazyVGrid(columns: colunas, spacing: 10) {
                    ForEach(desenhosPesquisados.indices, id: \.self) { indice in
                        let desenho = desenhosPesquisados[indice]

                        Button(action: {
                            self.nossosDesenhosViewModel?.esconderTeclado()
                            self.desenhoSelecionado = "\(desenho.nomeDiretorio)"
                            self.imagemEstaSelecionada = true
                        }, label: {
                            Image("\(desenho.nomeDiretorioMiniatura)")
                                .resizable()
                                .frame(width: self.larguraTela * 0.2, height: self.larguraTela * 0.2)
                                .cornerRadius(10)
                                .clipped()
                                .shadow(color: Color.black.opacity(0.3), radius: 0.5, x: 2, y: 2)
                        })
                    }
                }
                .padding(.horizontal, 5)
            }
            Spacer()
        }
        .onChange(of: textoPesquisa) { novaPesquisa in
            if let nossosDesenhosViewModel {
                self.desenhosPesquisados = nossosDesenhosViewModel.buscaDesenhosPesquisados(categorias: self.categorias, textoPesquisado: novaPesquisa)
            }
        }
    }
    
    
    
}
