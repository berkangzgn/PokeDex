//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import Foundation

class PokemonViewModel: ObservableObject {
    // MARK: Pokemon List request
    func getPokemonList(completion: @escaping ([Pokemon]) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=150") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            let pokemonResponse = try! JSONDecoder().decode(PokemonResponse.self, from: data!)
            var pokemons: [Pokemon] = []
            for (index, pokemonResult) in pokemonResponse.results.enumerated() {
                pokemons.append(Pokemon(id: index+1, name: pokemonResult.name, url: pokemonResult.url, imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/\(index + 1).png"))
            }
            DispatchQueue.main.async {
                print(pokemons)
                completion(pokemons)
            }
        }.resume()
    }

    // MARK: Pokemon Detail Request
    func getPokemonDetail(id: Int, completion: @escaping (PokemonDetail) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let responseData = data else { return }
            print(responseData)
            let pokemonResponse = try! JSONDecoder().decode(PokemonDetail.self, from: data!)

            print(pokemonResponse)
            DispatchQueue.main.async {
                completion(pokemonResponse)
            }
        }.resume()
    }
}
