//
//  View+AttributeStyle.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import SwiftUI

extension View {
    func attributeStyle(color: Color) -> some View {
        self.modifier(Attribute(color: color))
    }
}
