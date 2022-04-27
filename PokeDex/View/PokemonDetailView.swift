//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject private var viewModel = PokemonDetailViewModel()
    private var id: Int
    
    init(id: Int) {
        self.id = id
        viewModel.fetchPokemonDetail(pokemonId: id)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Text(self.viewModel.pokemon.name)
                        .font(.title)
                        .textCase(.uppercase)
                    Text("#\(self.id)")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                
                // MARK: Sprites
                HStack {
                    VStack {
                        ImageView(withURL: viewModel.pokemon.sprites.frontDefault)
                        ImageView(withURL: viewModel.pokemon.sprites.frontShiny)
                    }
                    VStack {
                        ImageView(withURL: viewModel.pokemon.sprites.backShiny)
                        ImageView(withURL: viewModel.pokemon.sprites.backDefault)
                    }
                }
                
                // MARK: Stats
                HStack(spacing: 30) {
                    VStack {
                        //Text("Height")
                        //    .attributeStyle(color: Color.orange)
                        Text("\(viewModel.pokemon.height) cm")
                            .attributeStyle(color: Color.orange)
                    }
                    VStack {
                        //Text("Weight")
                        //    .attributeStyle(color: Color.blue)
                        Text("\(viewModel.pokemon.weight) kg")
                            .attributeStyle(color: Color.blue)
                    }
                }
                Section(header: Text("Status")
                    .font(.title2)
                    .fontWeight(.bold)) {
                    ForEach(viewModel.pokemon.stats, id: \.stat.name) { stat in
                        VStack {
                            HStack(spacing: 25) {
                                Group {
                                    Text(stat.formattedName)
                                        .fontWeight(.bold)
                                        .frame(minWidth: 60, alignment: .leading)
                                    Text("\(stat.baseStat)")
                                        .frame(minWidth: 40)
                                }/*
                                ProgressBar(value: Float(stat.baseStat) / Float(stat.maximumStat))*/
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(25)
        }.navigationBarTitle(Text(viewModel.pokemon.formattedName), displayMode: .inline)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(id: 1)
    }
}
