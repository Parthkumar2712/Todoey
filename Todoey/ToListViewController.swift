//
//  ViewController.swift
//  Todoey
//
//  Created by einfochips on 16/05/18.
//  Copyright © 2018 einfochips. All rights reserved.
//

import UIKit

class ToListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

}
