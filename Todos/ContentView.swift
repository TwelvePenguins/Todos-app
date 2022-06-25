//
//  ContentView.swift
//  Todos
//
//  Created by Yuhan Du on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
    var todos = [
        Todo(title: "Watch some paw patrol"),
        Todo(title: "Conduct a giveaway"),
        Todo(title: "Randomly deduct some points")
    ]
    
    var body: some View {
        List(todos) { todo in
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
