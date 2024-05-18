//
//  ToDoDetailsViewModel.swift
//  ToDoApp
//
//  Created by Kaan Uzun on 18.05.2024.
//

import Foundation

class ToDoDetailsViewModel {
    var drepo = ToDoRepository()
    
    func update(todo:TodoModel, todoName:String, todoDescription:String){
        drepo.update(todo: todo, todoName: todoName, todoDescription: todoDescription)
    }
}
