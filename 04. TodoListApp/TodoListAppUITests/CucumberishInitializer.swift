//
//  CucumberishInitializer.swift
//  TodoListAppUITests
//
//  Created by Luann Luna on 10/05/22.
//

import Foundation
import Cucumberish

class CucumberishInitializer: NSObject {
    @objc class func setupCucumberish() {
        
        let todoListHomePage = TodoListHomePage()
        
        before { _ in
            // write teste right here
            Given("I launch the app") { args, userInfo in
                todoListHomePage.launch()
            }
            
            When("I add \"([^\\\"]*)\" as a task") { args, _ in
                let task = (args?[0])!
                
                todoListHomePage.typeInTaskTextField(task)
                todoListHomePage.tapAddTaskButton()
                
                //let taskTextField = XCUIApplication().textFields["taskTextField"]
                //taskTextField.tap()
                //taskTextField.typeText(task + "\n")
                
                //XCUIApplication().buttons["addTaskButton"].tap()
            }
            
            Then("I should have \"([^\\\"]*)\" item in the list") { args, _ in
                let itemCount = Int((args?[0])!)!
                
                //let taskCount = XCUIApplication().tables.children(matching: .cell).count
                //XCTAssertEqual(itemCount, taskCount)
                XCTAssertEqual(itemCount, todoListHomePage.totalTask)
            }
            
            // zero tasks
            Given("I launch the app for the first time") { _, _ in
                //XCUIApplication().launch()
                todoListHomePage.launch()
            }
            
            Then("I should see 0 tasks") { _, _ in
                //let taskCount = XCUIApplication().tables.children(matching: .cell).count
                //XCTAssertEqual(0, taskCount)
                XCTAssertEqual(0, todoListHomePage.totalTask)
            }
        }
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }
}
