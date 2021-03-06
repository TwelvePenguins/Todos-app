//
//  ContentView.swift
//  Todos
//
//  Created by Yuhan Du on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var isSheetGiven = false
    @State var todos = [
        Todo(title: "TRYHARD IN ELDEN RING", isCompleted: true, details: "Deeproot depths"),
        Todo(title: "Cry over red dead redemption 2"),
        Todo(title: "Actually do homework")
    ]
    @AppStorage ("username") var name = ""
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        NavigationView {
            List {
                TextField("Enter your name", text: $name)
                ForEach ($todoManager.todos) { $todo in
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
                    todoManager.todos.move(fromOffsets: oldOffset, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    todoManager.todos.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("My important things")
            .toolbar { //at top and bottom
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        isSheetGiven = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isSheetGiven){
                NewTodoView(todos: $todos)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
