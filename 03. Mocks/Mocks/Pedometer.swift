//
//  Pedometer.swift
//  Mocks
//
//  Created by Luann Luna on 10/05/22.
//

import Foundation
import CoreMotion

protocol Pedometer {
    var pedometerAvaliable: Bool { get }
    var pedometerDeclined: Bool { get }
    func start(dataUpdates: @escaping (PedometerData?, Error?) -> Void, eventUpdates: @escaping (Error?) -> Void)
}

protocol PedometerData {
    var steps: Int { get }
    var distanceTravelled: Double { get }
}

extension CMPedometer: Pedometer {
    
    var pedometerDeclined: Bool {
        return CMPedometer.authorizationStatus() == .denied
    }
    
    var pedometerAvaliable: Bool {
        return CMPedometer.isStepCountingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.authorizationStatus() != .restricted
    }
    
    func start(dataUpdates: @escaping (PedometerData?, Error?) -> Void, eventUpdates: @escaping (Error?) -> Void) {
        self.startUpdates(from: Date()) { data, error in
            dataUpdates(data, error)
        }
        
        self.startEventUpdates { event, error in
            eventUpdates(error)
        }
    }
}

extension CMPedometerData: PedometerData {
    var steps: Int {
        return self.numberOfSteps.intValue
    }
    
    var distanceTravelled: Double {
        return distance?.doubleValue ?? 0.0
    }
}
