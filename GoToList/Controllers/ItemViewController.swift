//
//  ViewController.swift
//  GoToList
//
//  Created by Katty Quintero on 29/8/21.
//

import UIKit
import CoreData

class ItemViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var itemArray = [Item]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    var detailCategories: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
      
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
    
//MARK: - Manipulation data Methods
    func saveContext() {
    
        do {
            try context.save()
        } catch {
        print("Error save context \(error)")
        }
        
    tableView.reloadData()
    }

    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {

        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error loading Items \(error)")
        }
        tableView.reloadData()
    }


    //MARK: - Add new Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
   
        var textField = UITextField()
         
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item(context: self.context)
            newItem.name = textField.text!
            newItem.parentCategory = self.detailCategories
            self.itemArray.append(newItem)
            
            self.saveContext()
            
            
        }
        alert.addTextField { (field) in
            field.placeholder = "Create new item"
            textField = field
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
