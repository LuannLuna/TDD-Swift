//
//  UnderAgeApplyingCardSteps.swift
//  AppleCardAcceptanceTests
//
//  Created by Luann Luna on 13/05/22.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
import XCTest
import Cucumberish

class UnderAgeApplyingCardSteps {
    func run() {
        
        Given("the following user information") { args, userInfo in
            XCUIApplication().launch()
            
            let rows: NSArray = userInfo?["DataTable"] as! NSArray
            for index in 1..<rows.count {
                let data = rows[index] as! NSArray
                let name = data[0] as! String
                let ssn = data[1] as! String
                let dob = data[2] as! String
                
                let nameTextField = XCUIApplication().textFields["nameTextField"]
                nameTextField.tap()
                nameTextField.typeText(name + "\n")
                
                let ssnTextField = XCUIApplication().textFields["ssnTextField"]
                ssnTextField.tap()
                ssnTextField.typeText(ssn + "\n")
                
                let dobTextField = XCUIApplication().textFields["dobTextField"]
                dobTextField.tap()
                dobTextField.typeText(dob + "\n")
            }
        }
        
        When("I press the apply button") { _, _ in
            XCUIApplication().buttons["applyButton"].tap()
        }
        
        Then("I should get a rejection message") { _, _ in
            
            let messageLabel = XCUIApplication().staticTexts["messageLabel"]
            
            XCTAssertEqual("Denied: Underage", messageLabel.label)
        }
    }
    
    
}
