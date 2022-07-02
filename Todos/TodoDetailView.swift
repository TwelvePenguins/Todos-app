//
//  TodoDetailView.swift
//  Todos
//
//  Created by Yuhan Du on 25/6/22.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        VStack{
            TextField("Todo title", text: $todo.title) //every text field must be bound to a state variable
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Button{
                withAnimation{
                    todo.isCompleted.toggle()
                }
            }label: {
                Text("Mark as \(todo.isCompleted ? "complete" : "incomplete") ")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(20)
            }

        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(Todo(title: "Smack Wonho 101 times")))
    }
}
