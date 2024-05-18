//
//  ToDoRepository.swift
//  ToDoApp
//
//  Created by Kaan Uzun on 18.05.2024.
//

import Foundation
import RxSwift
import CoreData

class ToDoRepository {
    
    var todoList = BehaviorSubject<[TodoModel]>(value: [TodoModel]())
    let context = appDelegate.persistentContainer.viewContext
    
    func save(todoName:String, todoDescription:String) {
        let todo = TodoModel(context: context)
        todo.todoName = todoName
        todo.todoDescription = todoDescription
        
        appDelegate.saveContext()
    }
    
    func update(todo:TodoModel, todoName:String, todoDescription:String){
        todo.todoDescription = todoDescription
        todo.todoName = todoName
    }
    
    
    func search(searchKey:String){
        do{
            let fetchRequest = TodoModel.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "todoName CONTAINS [c] %@", searchKey)
            let list = try context.fetch(fetchRequest)
            todoList.onNext(list) //Triggering
        }catch {
            print(error.localizedDescription)
        }
    }
    
    func delete(todo:TodoModel){
        context.delete(todo)
        appDelegate.saveContext()
    }
    
    func todoUpload(){
        var list = [TodoModel]()
        
        do {
            let fetchRequest = TodoModel.fetchRequest()
            let list = try context.fetch(fetchRequest)
            todoList.onNext(list)//Triggering
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

