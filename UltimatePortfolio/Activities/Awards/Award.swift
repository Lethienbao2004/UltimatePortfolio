//
//  Award.swift
//  UltimatePortfolio
//
//  Created by Mark Le on 12/17/20.
//

import Foundation

struct Award: Decodable, Identifiable {
    var id: String {name}
    var name: String
    var description: String
    var color: String
    var criterion: String
    let value: Int
    let image: String
    static let allAwards = Bundle.main.decode([Award].self, from: "Awards.json")
    static let example = allAwards[0]
}
