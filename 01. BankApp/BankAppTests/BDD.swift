//
//  BDD.swift
//  BankAppTests
//
//  Created by Luann Luna on 10/05/22.
//

import XCTest
@testable import BankApp

class Setting_Up_Account: XCTestCase {
    var account: Account!
    
    override func setUp() {
        super.setUp()
        
        account = Account()
    }
}

class When_creating_a_bank_account: Setting_Up_Account {

    func test_should_initialize_the_account_with_zero_balance() {
        XCTAssertEqual(0, account.balance)
    }
}


class When_depositing_money_into_bank_account: Setting_Up_Account {
    func test_should_deposit_successfully() {
        account.deposit(100)
        XCTAssertEqual(100, account.balance)
    }
}

class When_withdrawing_funds_from_account: Setting_Up_Account {
    func test_should_make_sure_amount_is_deducted_successfully() {
        account.deposit(100)
        
        try! account.withdraw(50)
        
        XCTAssertEqual(50, account.balance)
    }
    
    func test_should_throw_exception_when_insufficient_funds() {
        account.deposit(100)
        
        XCTAssertThrowsError(try account.withdraw(300)) { error in
            XCTAssertEqual(error as! AccountError, .insufficientFunds)
        }
    }
}
