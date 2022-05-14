//
//  PokemonView.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 13.05.2022.
//

import SwiftUI

struct PokemonView: View {
    @ObservedObject private var viewModel = PokemonViewModel()
    @State var details: PokemonDetail?

    var id: Int

    var body: some View {
        VStack {
            PokemonDetailView(id: self.id, pokemon: self.details)
        }.onAppear {
            viewModel.getPokemonDetail(id: self.id) { pokemon in
                self.details = pokemon
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(id: 150)
    }
}
