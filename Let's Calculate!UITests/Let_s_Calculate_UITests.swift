//
//  Let_s_Calculate_UITests.swift
//  Let's Calculate!UITests
//
//  Created by Jo Thorpe on 17/06/2018.
//  Copyright © 2018 Oxfam Reject. All rights reserved.
//

import XCTest
@testable import Let_s_Calculate_

class Let_s_Calculate_UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testReadTagWhenPressed(){
        
        let app = XCUIApplication()
        app.buttons["2"].tap()
        
        XCTAssert(app.staticTexts["2"].exists)
        
    }
    
    func testMultipleDecimalPoints() {
        
        let app = XCUIApplication()
        app.buttons["6"].tap()
        let button = app.buttons["."]
        button.tap()
        button.tap()
        app.alerts["Incorrect Function"].buttons["Ok"].tap()
       
        XCTAssert(app.staticTexts["6."].exists)
    }
    
    func testAllClear(){
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["AC"].tap()
        app.buttons["3"].tap()
        
        XCTAssert(app.staticTexts["3"].exists)
        
    }
    
    func testClear(){
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["C"].tap()
        
        XCTAssert(app.staticTexts["1"].exists)
        
    }
    
    func testDisplayFull(){
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.alerts["Incorrect Function"].buttons["Ok"].tap()
    
        XCTAssert(app.staticTexts["121212121"].exists)
        
    }
    
    func testNoDecimalAtEnd(){
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.alerts["Incorrect Function"].buttons["Ok"].tap()

        XCTAssert(app.staticTexts["12121212"].exists)
    }
    
    func testShowOperators(){
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["-"].tap()
        app.buttons["3"].tap()
        
        XCTAssert(app.staticTexts["1+2-3"].exists)
    }
    
    func testEqualsClearsOperatorsAndDisplaysResult(){
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["-"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        XCTAssert(app.staticTexts["0"].exists)
    }
    
    func testSymbolAfterEqualsDisplay(){
       
        let app = XCUIApplication()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        app.buttons["-"].tap()
        app.buttons["4"].tap()
        
        XCTAssert(app.staticTexts["6-4"].exists)
        
    }
    
    func testDecimalCalculation(){
        
        let app = XCUIApplication()
        app.buttons["4"].tap()
        app.buttons["."].tap()
        app.buttons["2"].tap()
        app.buttons["-"].tap()
        app.buttons["5"].tap()
        app.buttons["."].tap()
        app.buttons["1"].tap()
        app.buttons["="].tap()
        
        XCTAssert(app.staticTexts["-0.9"].exists)
        
    }
    
    
    func testBothOperators(){
        
        let app = XCUIApplication()
        app.buttons["7"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["-"].tap()
        app.buttons["1"].tap()
        app.buttons["="].tap()
        
        XCTAssert(app.staticTexts["8"].exists)
        
    }
    
    func testAddToNull(){
        
        let app = XCUIApplication()
        app.buttons["+"].tap()
        app.alerts["Incorrect Function"].buttons["Ok"].tap()
        
        XCTAssert(true)
        
    }
    
    func testIsLastCharOperator(){
        
        let app = XCUIApplication()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["="].tap()
        app.alerts["Incorrect Function"].buttons["Ok"].tap()
        
        XCTAssert(app.staticTexts["4+"].exists)
        
    }
    
    func testEqualsPressedWithNoOperatorOnDisplay(){
        
        let app = XCUIApplication()
        app.buttons["="].tap()
        app.alerts["Incorrect Function"].buttons["Ok"].tap()
        
        XCTAssert(true)
    }
    
    func testOperatorPressedAfterDot(){
        
        let app = XCUIApplication()
        app.buttons["4"].tap()
        app.buttons["."].tap()
        app.buttons["-"].tap()
        app.alerts["Incorrect Function"].buttons["Ok"].tap()
        
        XCTAssert(app.staticTexts["4."].exists)
        
    }
    
}
