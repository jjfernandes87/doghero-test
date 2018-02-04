//
//  doghero_UITests.swift
//  doghero-UITests
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import XCTest

class doghero_UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - ViewController class
extension doghero_UITests {

    func testShowRootScreen() {
        let app = XCUIApplication()
        XCTAssert(app.navigationBars["Meus Heróis"].exists)
        XCTAssert(app.tables.staticTexts["Heróis com quem hospedei"].exists)
        XCTAssert(app.tables.staticTexts["Heróis favoritos"].exists)
    }
    
    func testCountTableElements() {
        let app = XCUIApplication()
        let count = app.tables.cells.count
        XCTAssert(count == 5)
    }
    
}
