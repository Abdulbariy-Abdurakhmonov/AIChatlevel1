//
//  Binding+EXT.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 28/05/26.
//

import SwiftUI
import Foundation

extension Binding where Value == Bool {

    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
