//
//  ToDoDetailsViewController.swift
//  ToDoApp
//
//  Created by Kaan Uzun on 18.05.2024.
//

import UIKit

class ToDoDetailsViewController: UIViewController {
    
    @IBOutlet weak var tfTodoName: UITextField!
    @IBOutlet weak var tfTodoDescription: UITextField!
    var viewModel = ToDoDetailsViewModel()
    var todo:TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind the data to the text fields
        if let todo = todo {
            tfTodoName.text = todo.todoName
            tfTodoDescription.text = todo.todoDescription
        }
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        if let t = todo, let name = tfTodoName.text,let description = tfTodoDescription.text {
            viewModel.update(todo: t, todoName: name , todoDescription: description)
        }
    }
    
}
