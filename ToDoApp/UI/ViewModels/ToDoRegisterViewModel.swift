//
//  ToDoRegisterViewModel.swift
//  ToDoApp
//
//  Created by Kaan Uzun on 18.05.2024.
//

import Foundation

class ToDoRegisterViewModel {
    var crepo = ToDoRepository()
    
    func save(todoName:String, todoDescription:String) {
        crepo.save(todoName: todoName, todoDescription: todoDescription)
    }
}
