//
//  JWTError.swift
//  CriptoSwift
//
//  Created by Luann Luna on 21/06/22.
//

import Foundation

public enum JWTError: Error {
    case invalidJWTString
    case invalidJWTObject
}

extension JWTError: LocalizedError {
    
    public var localizedDescription:String {
        switch self {
        case .invalidJWTString:         return "Invalid JWT String"
        case .invalidJWTObject:         return "Invalid JWT Object"
        }
    }
    
}
