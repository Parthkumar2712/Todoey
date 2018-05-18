//
//  ViewController.swift
//  Todoey
//
//  Created by einfochips on 16/05/18.
//  Copyright © 2018 einfochips. All rights reserved.
//

import UIKit

class ToListViewController: UITableViewController {

    var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let items = defaults.array(forKey: "TodoListArray") as? [String]
        {
            itemArray = items
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell",for : indexPath)
        
    cell.textLabel?.text = itemArray[indexPath.row]
       // print(itemArray[indexPath.row])
        return cell
    }
    
    //MARK - Table Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //print(indexPath.row)
       if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
       else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Item
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem)
    {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "create new", style: .default) { (action) in
            //what will happen once the user clicks the add Item button on over UI Alert
            
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
    
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
}

