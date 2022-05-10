//
//  MockPedometer.swift
//  MocksTests
//
//  Created by Luann Luna on 10/05/22.
//

import Foundation
@testable import Mocks
import CoreMotion

class MockPedometer: Pedometer {
    
    private(set) var started: Bool = false
    
    var pedometerAvaliable: Bool = true
    var pedometerDeclined: Bool = false
    
    var error: Error?
    
    var updateBlock: ((Error?) -> Void)?
    var dataBlock: ((PedometerData?, Error?) -> Void)?
    
    static let notAuthorizedError = NSError(domain: CMErrorDomain, code: Int(CMErrorMotionActivityNotAuthorized.rawValue), userInfo: nil)
    
    func sendData(_ data: PedometerData) {
        self.dataBlock?(data, error)
    }
    
    func start(dataUpdates: @escaping (PedometerData?, Error?) -> Void, eventUpdates: @escaping (Error?) -> Void) {
        self.started = true
        self.updateBlock = eventUpdates
        self.dataBlock = dataUpdates
        
        DispatchQueue.global(qos: .default).async {
            self.updateBlock?(self.error)
        }
    }
}
