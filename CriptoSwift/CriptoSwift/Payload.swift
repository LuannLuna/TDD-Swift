//
//  Payload.swift
//  CriptoSwift
//
//  Created by Luann Luna on 21/06/22.
//

import Foundation

struct Payload: Codable {
    var sub: String?
    var name: String?
    var iat: Int?
}
