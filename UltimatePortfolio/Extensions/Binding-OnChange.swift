//
//  Binding-OnChange.swift
//  UltimatePortfolio
//
//  Created by Mark Le on 11/14/20.
//

import Foundation
import SwiftUI

extension Binding {
    func onchange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: {self.wrappedValue},
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
