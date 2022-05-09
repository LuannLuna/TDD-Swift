//
//  Account.swift
//  BankApp
//
//  Created by Luann Luna on 09/05/22.
//

import Foundation

enum AccountError: Error {
    case insufficientFunds
}

struct Account {
    var balance: Double = 0.0
    
    mutating func deposit(_ amount: Double) {
        self.balance += amount
    }
    
    mutating func withdraw(_ amount: Double) throws {
        let netBalance = balance - amount
        if netBalance < 0 {
            throw AccountError.insufficientFunds
        } else {
            balance -= amount
        }
    }
}
