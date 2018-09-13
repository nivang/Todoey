//
//CategoryViewControllerTableViewController.swift
//  Todoey
//
//  Created by Nivan Gujral on 9/12/18.
//  Copyright © 2018 Nivan Gujral. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewControllerTableViewController: UITableViewController {

    var catagories = [Category]()
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCatagories()
    }
    //MARK - tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath )
        
        cell.textLabel?.text = catagories[indexPath.row].name
        
        return cell
    }
    
    //MARK - tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = catagories[indexPath.row]
        }
    }
    //MARK - tableview Manipulation Methods
    func saveCategories() {
        do {
            try context.save()
        }catch{
            print("error saving catagorie , \(error)")
        }
        tableView.reloadData()
        
    }
    
    func loadCatagories() {
        
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        
        do{
            catagories = try context.fetch(request)
        }catch{
            print("error reloding data, \(error)")
        }
       
        tableView.reloadData()
    }
    //MARK - add new category
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.catagories.append(newCategory)
            
            self.saveCategories()
            
        }
        
            alert.addAction(action)
            
            alert.addTextField { (field) in
                textField = field
                textField.placeholder = "add a new category"
            }
            present(alert, animated: true, completion: nil)
        }
    }


