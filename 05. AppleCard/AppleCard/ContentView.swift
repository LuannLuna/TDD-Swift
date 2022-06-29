//
//  ContentView.swift
//  AppleCard
//
//  Created by Mohammad Azam on 4/27/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = ""
    @State private var ssn: String = ""
    @State private var dob: String = "
    var body: some View {
        
        NavigationView {
            
            VStack {
                TextField("Enter name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "nameTextField")
                
                TextField("Enter ssn", text: $ssn)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "ssnTextField")
                
                TextField("Enter DoB", text: $dob)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "dobTextField")
                
                Button("Apply") {
                    
                }
                .accessibility(identifier: "applyButton")
                .pa
                
                
                Spacer()
                
                
            }.padding()
            
            .navigationBarTitle("Apply for Card")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
