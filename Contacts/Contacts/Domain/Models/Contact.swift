//
//  Contact.swift
//  Contacts
//
//  Created by Luann Luna on 26/05/22.
//

import Foundation

struct ContactResponseModel: Identifiable, Equatable, Hashable {
    let id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String = "") {
        self.id = id
        self.name = name
    }
}

struct ContactRequestModel: Equatable {
    var name: String
    
    init(name: String = "") {
        self.name = name
    }
}
