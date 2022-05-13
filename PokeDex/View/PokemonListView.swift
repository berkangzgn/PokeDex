//
//  PokemonListView.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 13.05.2022.
//

import SwiftUI

struct PokemonListView: View {
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonView(id: pokemon.id)) {
                    HStack{
                        AsyncImage(url: URL(string: pokemon.imageUrl))
                            .scaledToFit()
                            .frame(maxHeight: 80)
                        Text(pokemon.name)
                            .font(.headline)
                            .textCase(.uppercase)
                        Spacer()
                    }
                    .padding(10)
                }
            }.onAppear {
                PokemonViewModel().getPokemonList { (pokemons) in
                    self.pokemons = pokemons
                }
            }.navigationTitle("PokeDex")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
