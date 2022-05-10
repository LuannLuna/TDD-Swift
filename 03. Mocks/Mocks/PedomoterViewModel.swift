//
//  PedomoverViewModel.swift
//  Mocks
//
//  Created by Luann Luna on 10/05/22.
//

import Foundation
import CoreMotion

enum AppState {
    case notStarted
    case inProgress
    case notAuthorized
}

class PedomoterViewModel {
    var pedometer: Pedometer
    var appState: AppState = .notStarted
    
    var steps: Int = 0
    var distanceTravelled: Double = 0.0
    
    init(pedometer: Pedometer) {
        self.pedometer = pedometer
    }
    
    func startPedometer() {
        guard self.pedometer.pedometerAvaliable else {
            self.appState = .notStarted
            return
        }
        
        guard !self.pedometer.pedometerDeclined else {
            self.appState = .notStarted
            return
        }
        
        self.appState = .inProgress
        
        self.pedometer.start { data, error in
            if let data = data {
                self.steps = data.steps
                self.distanceTravelled = data.distanceTravelled
            }
        } eventUpdates: { error in
            if let error = error {
                let nsError = error as NSError
                if nsError.domain == CMErrorDomain && nsError.code == CMErrorMotionActivityNotAuthorized.rawValue {
                    self.appState = .notAuthorized
                }
            }
        }
    }
}
