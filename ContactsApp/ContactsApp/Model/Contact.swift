//
//  Contact.swift
//  ContactsApp
//
//  Created by Luann Luna on 09/06/22.
//

import Foundation

struct Contact: Decodable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let gender: String
    let pictureURL: String
    let phone: String
    let birthday: String
    let twitterHandle: String
}
