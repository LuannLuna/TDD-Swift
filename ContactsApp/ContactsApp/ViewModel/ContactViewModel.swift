//
//  ContactViewModel.swift
//  ContactsApp
//
//  Created by Luann Luna on 09/06/22.
//

import Foundation


class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    
    func getContact() {
        let service = ContactService()
        service.getContacts { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let contacts):
                DispatchQueue.main.async {
                    self.contacts = contacts
                }
            }
        }
    }
}
