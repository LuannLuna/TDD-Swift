//
//  ContentView.swift
//  TodoListApp
//
//  Created by Luann Luna on 10/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var taskName: String = ""
    @State private var tasks = [String]()
    
    var body: some View {
        VStack {
            TextField("Enter task", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .accessibility(identifier: "taskTextField")
            
            Button {
                self.tasks.append(taskName)
            } label: {
                Text("Add")
            }.accessibility(identifier: "addTaskButton")
            
            List(self.tasks, id: \.self) { name in
                Text(name)
            }
            
            Spacer()
        }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
