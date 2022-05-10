//
//  AlertManager.swift
//  TestingMultipleExpactations
//
//  Created by Luann Luna on 09/05/22.
//

import Foundation

extension Notification.Name {
    static let alertNotification = Notification.Name("alertNotification")
}

class AlertManager {
    func postAlert() {
        NotificationCenter.default.post(name: .alertNotification, object: nil)
    }
}
