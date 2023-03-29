//
//  NossosDesenhosView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
struct NossosDesenhosView: View {
    @State var imagemEstaSelecionada = false
    @State var desenhoSelecionado = ""
    
    @State private var textoPesquisa = ""
    @State var filtroSelecionado = ""
    @State var filtroAberto = false
    
    @State var infDesenho: InfDesenho? = nil
    @State var categorias = [Categoria]()
    @State var recebeuInfDesenho = false
    var nossosDesenhosViewModel = NossosDesenhosViewModel()
    
    var body: some View {
        ZStack {
            if recebeuInfDesenho {
                NavigationLink(destination: ConfirmarDesenhoView(dadosImagemSelecionada: .constant(Data()), desenhoSelecionado: $desenhoSelecionado), isActive: self.$imagemEstaSelecionada, label: {})
                VStack {
                    SearchBarComponente(
                        textoPesquisa: self.$textoPesquisa,
                        filtroAberto: self.$filtroAberto,
                        filtroSelecionado: self.$filtroSelecionado)
                    
                    if filtroSelecionado == "" {
                        ScrollView {
                            ForEach(self.categorias, id: \.id) { categoria in
                                CarrosselComponente(
                                    imagemEstaSelecionada: self.$imagemEstaSelecionada,
                                    desenhoSelecionado: self.$desenhoSelecionado,
                                    categoriaDesenhos: .constant(categoria.nomeCategoria),
                                    desenhos: .constant(categoria.desenhos))
                                    .padding(.top, 5)
                            }
                        }
                    } else {
                        CategoriaEscolhidaComponente(
                            imagemEstaSelecionada: self.$imagemEstaSelecionada,
                            desenhoSelecionado: self.$desenhoSelecionado,
                            filtroSelecionado: self.$filtroSelecionado,
                            categorias: .constant(self.categorias))
                    }
                }
                FiltroNossosDesenhosComponente(categorias: $categorias, filtroAberto: self.$filtroAberto, filtroSelecionado: self.$filtroSelecionado)
            } else {
                ProgressView()
            }
            
        }
        .navigationBarTitle(Text("Nossos Desenhos"), displayMode: .inline)
        .onAppear {
            self.nossosDesenhosViewModel.buscarInfDesenho {
                self.recebeuInfDesenho = true
                self.infDesenho = self.nossosDesenhosViewModel.carregadorInfDesenho?.infDesenho
                self.categorias = self.infDesenho!.categorias
            }
            
            
        }
    }
}
