//
//  ToDoRegisterViewController.swift
//  ToDoApp
//
//  Created by Kaan Uzun on 18.05.2024.
//

import UIKit

class ToDoRegisterViewController: UIViewController {
    
    
    @IBOutlet weak var tfTodoName: UITextField!
    @IBOutlet weak var tfTodoDescription: UITextField!
    var viewModel = ToDoRegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSave(_ sender: Any) {
        if let name = tfTodoName.text, let description = tfTodoDescription.text {
            viewModel.save(todoName: name, todoDescription: description)
        }
    }
    
}
