//
//  TelaFiltroEscolhidoView.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 24/03/23.
//

import SwiftUI

struct CategoriaEscolhidaComponente: View {
    let itens = 1...50
    let colunas = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @Binding var imagemEstaSelecionada: Bool
    @Binding var desenhoSelecionado: String
    @Binding var referenciaDesenhoSelecionado: String
    @Binding var filtroSelecionado: String
    @Binding var categorias: [Categoria]
    
    var nossosDesenhosViewModel: NossosDesenhosViewModel? = nil
    
    let larguraTela = UIScreen.main.bounds.size.width
    var body: some View {
        ScrollView {
            HStack {
                Text("\(self.filtroSelecionado)")
                    .font(.custom("AveriaGruesaLibre-Regular", fixedSize: 25))
                    .foregroundColor(.accentColor)
                    .padding(10)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                Spacer()
            }
            LazyVGrid(columns: colunas, spacing: 10) {
                ForEach(self.categorias, id: \.id) { categoria in
                    if categoria.nomeCategoria == self.filtroSelecionado {
                        ForEach(categoria.desenhos, id: \.id) { desenho in
                            Button(action: {
                                self.nossosDesenhosViewModel?.esconderTeclado()
                                self.desenhoSelecionado = "\(desenho.nomeDiretorio)"
                                self.referenciaDesenhoSelecionado = "\(desenho.referenciaImagem)"
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
                }
            }
            .padding(.horizontal, 5)
        }
        
    }
}
