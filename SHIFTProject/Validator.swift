//
//  Validator.swift
//  SHIFTProject
//
//  Created by Дмитрий К on 11.07.2025.
//

import UIKit

class Validator {
    
    static func isNameValid(_ name: String?) -> Bool {
        if let name, name.count > 2 {
                return true
            }
        return false
        }
    
    static func isAgeValid(_ date: Date) -> Bool {
        let components = Calendar.current.dateComponents([.year], from: date, to: Date.now)
        if let years = components.year, years >= 18 {
                return true
            }
        return false
    }
    
    static func isPasswordValid(_ password: String?) -> Bool {
        
        let pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
        if let password,
              NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: password) {
            print("Valid password")
            return true
        }
        return false
    }
}
