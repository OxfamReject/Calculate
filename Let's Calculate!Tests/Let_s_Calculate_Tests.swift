//
//  Let_s_Calculate_Tests.swift
//  Let's Calculate!Tests
//
//  Created by Jo Thorpe on 17/06/2018.
//  Copyright © 2018 Oxfam Reject. All rights reserved.
//

import XCTest
@testable import Let_s_Calculate_

class Let_s_Calculate_Tests: XCTestCase {
    
    var logicUnderTest: CalculatorLogic!
    
    override func setUp() {
        super.setUp()
        logicUnderTest = CalculatorLogic()
    }
    
    override func tearDown() {
        logicUnderTest = nil
        super.tearDown()
    }
    
    
    //Tests for calculator logic
    
    func testSubtraction(){
        var subtractedNumbers: String = ""
        subtractedNumbers = logicUnderTest.minusNumbers(value1: "5", value2: "3")
         XCTAssertEqual(subtractedNumbers,"2.", "Score computed from subtraction formula is wrong")
    }
    
    func testAddition(){
        var addedNumbers: String = ""
        addedNumbers = logicUnderTest.addNumbers(value1: "5", value2: "3")
        XCTAssertEqual(addedNumbers,"8.", "Score computed from addition formula is wrong")
    }
    
    func testDoubleToInt(){
        var convertedNumber: String = ""
        convertedNumber = logicUnderTest.resultToInt(value1: "8.0")
        XCTAssertEqual(convertedNumber, "8", "Conversion from double to int has failed")
    }
    
}
