//
//  MainView.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.pokemonList.indices, id: \.self) { index in
                NavigationLink(destination: PokemonDetailView(id: index + 1)) {
                    HStack {
                        ImageView(withURL: viewModel.getImageURL(pokemonId: index + 1))
                        Text(viewModel.pokemonList[index].formattedName)
                    }
                }
            }
            .navigationTitle("P@kedex")
        }
        .onAppear(perform: viewModel.fetchData)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
