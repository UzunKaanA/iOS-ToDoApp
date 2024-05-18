//
//  HomepageViewModel.swift
//  ToDoApp
//
//  Created by Kaan Uzun on 18.05.2024.
//

import Foundation
import RxSwift

class HomepageViewModel {
    var hrepo = ToDoRepository()
    var todoList = BehaviorSubject<[TodoModel]>(value: [TodoModel]())
    
    init(){
        todoList = hrepo.todoList
    }
    
    func search(searchKey:String){
        hrepo.search(searchKey: searchKey)
    }
    
    func delete(todo:TodoModel){
        hrepo.delete(todo: todo)
        todoUpload()
    }
    
    func todoUpload(){
        hrepo.todoUpload()
    }
}
