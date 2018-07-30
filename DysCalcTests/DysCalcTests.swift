//
//  DysCalcTests.swift
//  DysCalcTests
//
//  Created by Matthew Curtner on 7/24/18.
//  Copyright © 2018 Matthew Curtner. All rights reserved.
//

import XCTest
@testable import DysCalc

class DysCalcTests: XCTestCase {
    
    var controller: NumberController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        controller = NumberController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRandomIntFromRange() {
        XCTAssertNotNil(controller.randomIntFromRange(from: 0, to: 10))
        XCTAssertEqual(controller.randomIntFromRange(from: 1, to: 1), 1)
    }
    
    func testExpectedSolution() {
        controller.lhsInt = 5
        controller.rhsInt = 10
        controller.storeSolution()
        
        XCTAssertEqual(controller.expectedSolution, 15)
    }
}
