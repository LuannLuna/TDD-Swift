//
//  MocksTests.swift
//  MocksTests
//
//  Created by Luann Luna on 10/05/22.
//

import XCTest
import CoreMotion
@testable import Mocks

class MocksTests: XCTestCase {
    
    var mock: MockPedometer!
    var pedometerVM: PedomoterViewModel!
    
    override func setUp() {
        super.setUp()
        mock = MockPedometer()
        pedometerVM = PedomoterViewModel(pedometer: mock)
    }
    
    func test_StartsPedometer() {
        
        pedometerVM.startPedometer()
        
        XCTAssertTrue(mock.started)
    }
    
    func test_PedometerNotAvaliable_DoesNotStart() {
        mock.pedometerAvaliable = false
        
        pedometerVM.startPedometer()
        
        XCTAssertEqual(pedometerVM.appState, .notStarted)
    }
    
    
    func test_PedometerNotAuthorized_DoesNotStart() {
        mock.pedometerDeclined = true
        pedometerVM.startPedometer()
        
        XCTAssertEqual(pedometerVM.appState, .notStarted)
    }
    
    func test_PedometerAuthorized_ShouldStart() {
        mock.pedometerDeclined = false
        pedometerVM.startPedometer()
        
        XCTAssertEqual(pedometerVM.appState, .inProgress)
    }
    
    func test_WhenAuthDeniedAfterStartGenerateError() {
        
        mock.error = MockPedometer.notAuthorizedError
        
        let exp = expectation(for: NSPredicate(block: { (thing, _) -> Bool in
            let vm = thing as! PedomoterViewModel
            return vm.appState == .notAuthorized
        
        }), evaluatedWith: pedometerVM, handler: nil)
        
        pedometerVM.startPedometer()
        
        wait(for: [exp], timeout: 2.0)
    }
    
    func test_whenPedometerUpdatesThenUpdatesViewModel() {
        let data = MockData(steps: 100, distanceTravelled: 10)
        
        pedometerVM.startPedometer()
        mock.sendData(data)
        
        XCTAssertEqual(100, pedometerVM.steps)
        XCTAssertEqual(10, pedometerVM.distanceTravelled)
    }
}
