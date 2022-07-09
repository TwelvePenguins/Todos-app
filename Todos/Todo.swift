//
//  Todo.swift
//  Todos
//
//  Created by Yuhan Du on 25/6/22.
//

import Foundation

struct Todo: Identifiable, Codable{ //struct now conforms to protocol called identifiable
    
    var id = UUID()
    var title: String
    var isCompleted: Bool = false //default value
    var details: String = ""
}
