//
//  TodoListHomePage.swift
//  TodoListAppUITests
//
//  Created by Luann Luna on 13/05/22.
//

import Foundation
import XCTest

class TodoListHomePage {
    func launch() {
        XCUIApplication().launch()
    }
    
    func typeInTaskTextField(_ text: String) {
        let textfield = XCUIApplication().textFields["taskTextField"]
        textfield.tap()
        textfield.typeText(text + "\n")
    }
    
    func tapAddTaskButton() {
        XCUIApplication().buttons["addTaskButton"].tap()
    }
    
    var totalTask: Int {
        XCUIApplication().tables.children(matching: .cell).count
    }
}
