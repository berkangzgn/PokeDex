//
//  PokemonDetailViewModel.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemon = Pokemon()
    
    func fetchPokemonDetail(id: Int, completion: @escaping (PokemonDetail) -> ()) {
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
