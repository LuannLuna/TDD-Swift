//
//  BankAppTests.swift
//  BankAppTests
//
//  Created by Luann Luna on 09/05/22.
//

import XCTest
@testable import BankApp

class BankAppTests: XCTestCase {

    var account: Account!
    
    override func setUp() {
        super.setUp()
        
        account = Account()
    }
    
    func test_InitialBalanceZero() {
        XCTAssertTrue(account.balance == 0, "Balance is not zero!")
    }

    func test_DepositFunds() {
        account.deposit(100)
        
        XCTAssertEqual(account.balance, 100)
    }
    
    func test_WithdrawFunds() {
        account.deposit(100)
        try? account.withdraw(50)
        
        XCTAssertEqual(50, account.balance)
    }
    
    func test_WidthdrawFromInsufficientFunds() {
        account.deposit(100)
        
        XCTAssertThrowsError(try account.withdraw(300)) { error in
            XCTAssertEqual(error as! AccountError, .insufficientFunds)
        }
    }
    
    override class func tearDown() {
        super.tearDown()
    }
}
