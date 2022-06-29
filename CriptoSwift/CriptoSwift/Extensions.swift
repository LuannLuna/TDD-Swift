//
//  Extensions.swift
//  CriptoSwift
//
//  Created by Luann Luna on 21/06/22.
//

import Foundation

extension Array {
    func getElement(at index: Int) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
}

extension Dictionary {
    func data(option: JSONSerialization.WritingOptions = .prettyPrinted) throws -> Data {
        return try JSONSerialization.data(withJSONObject: self, options: option)
    }
}

extension Data {
    func asString(enoding: String.Encoding = .utf8) -> String? {
        return String(data: self, encoding: .utf8)
    }
}
