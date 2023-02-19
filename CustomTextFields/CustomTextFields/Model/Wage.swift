//
//  Wage.swift
//  CustomTextFields
//
//  Created by Anderson Sales on 19/02/23.
//

import Foundation

class Wage {
    class func getHours(for wage: Double, and price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
