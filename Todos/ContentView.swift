//
//  ContentView.swift
//  Todos
//
//  Created by Yuhan Du on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [
        Todo(title: "TRYHARD IN ELDEN RING", isCompleted: true, details: "Deeproot depths"),
        Todo(title: "Cry over red dead redemption 2"),
        Todo(title: "Actually do homework")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach ($todos) { $todo in
                    NavigationLink{
                        TodoDetailView(todo: $todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            VStack (alignment: .leading){
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted)
                                    .foregroundColor(todo.isCompleted ? .green : .red)
                                if !todo.details.isEmpty{
                                    Text(todo.details)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .onMove { oldOffset, newOffset in
                    todos.move(fromOffsets: oldOffset, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    todos.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("My important things")
            .toolbar { //at top and bottom
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
