//
//  ViewController.swift
//  CriptoSwift
//
//  Created by Luann Luna on 21/06/22.
//

import UIKit
import CryptoSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let header = JWTHeader(alg: .hs256)
        let payload = Payload(sub: "qwerty", name: "John Doe", iat: 10001)
        let signature = "t19zsvbH7tDBNUJ2EQAq4FUtBQAYKgUOVAmQ02CvIlAl3xScu91gQdqRq2aE3xZpXiwU-ZzjJrtaxrSICereEQ"
        let jwt = JWT<Payload>(header: header, payload: payload, signature: signature)
        // Create JWT Object

        let jwtToken = JWTEncoder.shared.encode(jwt: jwt)
        
    }
    
}

