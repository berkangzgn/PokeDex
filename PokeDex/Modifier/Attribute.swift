//
//  Attribute.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 13.05.2022.
//

import Foundation
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

extension View {
    func attributeStyle(color: Color) -> some View {
        self.modifier(Attribute(color: color))
    }
}
