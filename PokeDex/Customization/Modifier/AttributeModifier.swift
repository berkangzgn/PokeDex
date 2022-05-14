//
//  AttributeModifier.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import SwiftUI

struct Attribute: ViewModifier {
    var color: Color

    func body(content: Content) -> some View {
        content
            .padding(5)
            .background(color)
            .clipShape(Capsule())
    }
}
