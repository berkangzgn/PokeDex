//
//  PokemonList.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import Foundation

struct Result: Decodable {
    var results: [PokemonList]
}

struct PokemonList: Decodable {
    var name: String
    var url: String
    
    var formattedName: String {
        String(Array(name)[0].uppercased() + name.dropFirst())
    }
}
