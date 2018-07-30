//
//  NumberController.swift
//  DysCalc
//
//  Created by Matthew Curtner on 7/25/18.
//  Copyright © 2018 Matthew Curtner. All rights reserved.
//

import Foundation

class NumberController {
    
    var lhsInt: Int!
    var rhsInt: Int!
    var expectedSolution: Int!
 
    /// Initialize the values
    func initalizeValues() {
        lhsInt = randomIntFromRange(from: 0, to: 10)
        rhsInt = randomIntFromRange(from: 0, to: 10)
        storeSolution()
        
        print(expectedSolution)
        
        while expectedSolution < 11 || expectedSolution > 20 {
            print("Looping for new number")
            
            lhsInt = randomIntFromRange(from: 0, to: 10)
            rhsInt = randomIntFromRange(from: 0, to: 10)
            storeSolution()
        }
    }
    
    /// Store the added value
    func storeSolution(){
        expectedSolution = lhsInt + rhsInt
    }
    
    /// Randomly get a number from the specified range
    ///
    /// - Parameters:
    ///   - from: Starting range int value
    ///   - to: Ending range int value
    /// - Returns: Random int value from the provided range
    func randomIntFromRange(from: Int, to: Int) -> Int {
        return Int.random(in: from...to)
    }
}
