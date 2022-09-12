//
//  GildedRoseTests.swift
//  GildedRoseTests
//
//  Created by Milan Anusjak on 12/09/2022.
//

import XCTest
@testable import GildedRose

final class GildedRoseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let contentView = ContentView(items: items)
        contentView.updateQuality()
        XCTAssertEqual(contentView.items[0].name, "fixme")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
