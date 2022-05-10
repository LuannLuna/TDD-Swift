//
//  TestingMultipleExpactationsTests.swift
//  TestingMultipleExpactationsTests
//
//  Created by Luann Luna on 09/05/22.
//

import XCTest
@testable import TestingMultipleExpactations

class TestingMultipleExpactationsTests: XCTestCase {

    func test_generates_two_notifications() {
        let alertManager = AlertManager()
        
        let exp = expectation(forNotification: Notification.Name.alertNotification, object: alertManager, handler: nil)
        
        exp.expectedFulfillmentCount = 2
        
        alertManager.postAlert()
        alertManager.postAlert()
        
        wait(for: [exp], timeout: 2.0)
    }

}
