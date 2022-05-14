//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import SwiftUI

struct PokemonDetailView: View {
    var id: Int
    var pokemon: PokemonDetail?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // MARK: Name
                HStack {
                    Text(self.pokemon?.name?.capitalized ?? "Pokemon")
                        .font(.title)
                        .textCase(.uppercase)
                    Text("#\(self.id)")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }

                // MARK: Image
                ImageView(id: self.id)

                // MARK: Height, weight
                LazyHStack(spacing: 30) {
                    VStack {
                        Text("Height")
                            .attributeStyle(color: Color.orange)
                        HStack {
                            Text(String(self.pokemon?.height ?? 1))
                            Text("cm")
                        }

                    }
                    VStack {
                        Text("Weight")
                            .attributeStyle(color: Color.blue)
                        HStack {
                            Text(String(self.pokemon?.weight ?? 1))
                            Text("g")
                        }
                    }
                }

                // MARK: Stats
                Text("Status")
                    .font(.title2)
                    .fontWeight(.bold)
                LazyHStack {
                    VStack(alignment: .leading, spacing: 10) {
                    ForEach((self.pokemon?.stats) ?? [], id: \.stat.name) { stat in
                            LazyHStack {
                                Text(stat.stat.name.capitalized)
                                    .bold()
                                Text(String(stat.base_stat))
                            }
                        }
                    }
                }
                Spacer()
            }.padding(25)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(id: 25)
    }
}
