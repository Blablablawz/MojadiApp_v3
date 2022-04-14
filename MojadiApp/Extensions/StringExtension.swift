//
//  StringExtension.swift
//  Siniar
//
//  Created by yoga arie on 31/03/22.
//

import Foundation

extension String{
    var isValidEmail : Bool{
     
            let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
            return predicate.evaluate(with: self)
        }
    var isPasswordValid: Bool{
        let regEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    var isValidPhone: Bool{
        let regEx = "^[0-9+]{0,1}+[0-9]{5,16}$"
                let phoneTest = NSPredicate(format: "SELF MATCHES %@", regEx)
                return phoneTest.evaluate(with: self)
//        if self.count >= 5 && self.count <= 16 && CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self)) {
//            return true
//        }
//        return false
    }
    }

