//
//  ToDoList.swift
//  ToDoApp
//
//  Created by Kaan Uzun on 18.05.2024.
//

import Foundation

class ToDoList {
    var todoID:Int?
    var todoName:String?
    var todoDescription:String?
    
    init(todoID: Int?, todoName: String?, todoDescription: String?) {
        self.todoID = todoID
        self.todoName = todoName
        self.todoDescription = todoDescription
    }
}
