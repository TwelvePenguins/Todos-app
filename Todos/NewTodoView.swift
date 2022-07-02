//
//  NewTodoView.swift
//  Todos
//
//  Created by Yuhan Du on 2/7/22.
//


import SwiftUI

struct NewTodoView: View {
    
    @State var todoTitle = ""
    @Binding var todos: [Todo]
    
    @Environment(\.dismiss) var dismiss
    //OR
    //@Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            TextField("Enter todo name", text: $todoTitle)
            
            Button("Save todo") {
                let todo = Todo(title: todoTitle)
                todos.append(todo)
                dismiss()
                //presentationMode.wrappedvalue.dismiss()
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(todos: .constant([]))
    }
}
