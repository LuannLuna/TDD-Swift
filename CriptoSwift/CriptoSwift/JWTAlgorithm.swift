//
//  JWTAlgorithm.swift
//  CriptoSwift
//
//  Created by Luann Luna on 21/06/22.
//

import Foundation

public enum JWTAlgorithm:String, Codable {
    case hs256 = "HS256"
    case hs384 = "HS384"
    case hs512 = "HS512"
    case ps256 = "PS256"
    case ps384 = "PS384"
    case ps512 = "PS512"
    case rs256 = "RS256"
    case rs384 = "RS384"
    case rs512 = "RS512"
}
