//
//  Extensions.swift
//  DysCalc
//
//  Created by Matthew Curtner on 7/25/18.
//  Copyright © 2018 Matthew Curtner. All rights reserved.
//

import UIKit

extension Int {
    /// Convert int to string value
    ///
    /// - Returns: int converted to string
    func toString() -> String {
        return String(self)
    }
}

extension String {
    /// Convert string to int value
    ///
    /// - Returns: string converted to int
    func toInt() -> Int {
        return Int(self)!
    }
}
