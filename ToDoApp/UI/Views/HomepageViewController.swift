//
//  ViewController.swift
//  ToDoApp
//
//  Created by Kaan Uzun on 17.05.2024.
//

import UIKit

class HomepageViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var todoTableView: UITableView!
    var todoList = [TodoModel]()
    var viewModel = HomepageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemIndigo
        
        searchBar.delegate = self //-> SearchBar's delegate to self -> UISearchBarDelegate connection.
        todoTableView.delegate = self
        todoTableView.dataSource = self

            _ = viewModel.todoList.subscribe(onNext: { liste in
                self.todoList = liste
                self.todoTableView.reloadData()
            })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.todoUpload()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let todo = sender as? TodoModel {
                let goingVC = segue.destination as! ToDoDetailsViewController
                goingVC.todo = todo
            }
        }
    }


}



extension HomepageViewController : UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      if(searchText == ""){
          viewModel.todoUpload()
      }else{
          viewModel.search(searchKey: searchText)
      }
  }
}

extension HomepageViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoTableViewCell
        
        let todo = todoList[indexPath.row]
        cell.lblName.text = todo.todoName
        cell.lblDescription.text = todo.todoDescription
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        //sending data to the "ToDo Details Page" with an identifier
        performSegue(withIdentifier: "toDetails", sender: todo)
        
        //Removing the UIView of the "stuck" selected row.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
          style: .destructive,
          title: "Delete"
        ){
          contexualAction,view,bool in

          let todo = self.todoList[indexPath.row]

            let alert = UIAlertController(title: "Deletion", message: "\(todo.todoName!) + Are you sure to delete?", preferredStyle: .alert)

          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
          alert.addAction(cancelAction)
          let eventAction = UIAlertAction(title: "Yes", style: .destructive){ _ in
              self.viewModel.delete(todo: todo)
          }
          alert.addAction(eventAction)

          self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    
}
