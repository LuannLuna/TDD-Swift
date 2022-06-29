//
//  ContentView.swift
//  ContactsApp
//
//  Created by Luann Luna on 09/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContactViewModel
    
    init() {
        viewModel = ContactViewModel()
    }
    
    var body: some View {
        List(viewModel.contacts, id: \.id) { contact in
            HStack {
                URLImage(url: contact.pictureURL)
                Text(contact.firstName + " " + contact.lastName)
            }
        }
        .onAppear {
            viewModel.getContact()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
