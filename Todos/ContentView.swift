//
//  ContentView.swift
//  Todos
//
//  Created by Yuhan Du on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
    var todos = [
        Todo(title: "Watch some paw patrol", isCompleted: true),
        Todo(title: "Conduct a giveaway"),
        Todo(title: "Randomly deduct some points")
    ]
    
    var body: some View {
        NavigationView{
            List(todos) { todo in
                HStack {
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                        .foregroundColor(todo.isCompleted ? .green : .red)
                }
            }
            .navigationTitle("My important things")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
