//
//  AssetTests.swift
//  UltimatePortfolioTests
//
//  Created by Mark Le on 3/19/21.
//

import XCTest
@testable import UltimatePortfolio

class AssetTests: XCTestCase {
    
    func testColorExists() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to laod color '\(color)' from asset catalog")
        }
    }
    
    func testJSONLoadsCorrectly() {
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load award from JSON")
    }
}
