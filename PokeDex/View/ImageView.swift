//
//  ImageView.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        Image(uiImage: imageLoader.image ?? UIImage())
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL:  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
    }
}
