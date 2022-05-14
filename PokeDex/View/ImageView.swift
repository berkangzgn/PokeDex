//
//  ImageView.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self.resizable().scaledToFit()
    }

    func iconModifier() -> some View {
        self.imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.9)
    }
}

struct ImageView: View {
    let id: Int
    private let mainUrl: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/"
    private let altUrl: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/"

    var body: some View {
        AsyncImage(url: URL(string: "\(self.altUrl)\(self.id).png"), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                .imageModifier()
                .transition(.move(edge: .bottom))
            case .failure:
                Image(systemName: "wifi.slash").iconModifier()
            @unknown default:
                Image(systemName: "ant.circle.fill").iconModifier()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(id: 3)
    }
}
