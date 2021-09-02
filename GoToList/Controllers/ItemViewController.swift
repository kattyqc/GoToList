//
//  ViewController.swift
//  GoToList
//
//  Created by Katty Quintero on 29/8/21.
//

import UIKit
import CoreData

class ItemViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//MARRK: - Data Source UITableViewController
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        cell.textLabel?.text =  itemArray[indexPath.row].name
        
        return cell
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
   
    
    }
    
}

