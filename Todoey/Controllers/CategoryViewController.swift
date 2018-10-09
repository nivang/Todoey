//
//CategoryViewControllerTableViewController.swift
//  Todoey
//
//  Created by Nivan Gujral on 9/12/18.
//  Copyright © 2018 Nivan Gujral. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewControllerTableViewController: UITableViewController {

    let realm = try! Realm()
    
    var catagories: Results<Category>?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCatagories()
    }
    //MARK - tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagories?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath )
        
        cell.textLabel?.text = catagories![indexPath.row].name ?? "No categories Added yet"
        
        return cell
    }
    
    //MARK - tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = catagories?[indexPath.row]
        }
    }
    //MARK - tableview Manipulation Methods
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
                }
            } catch {
                print("Error saving category \(error)")
            }
        tableView.reloadData()
        
    }
    
    func loadCatagories() {

        let categories = realm.objects(Category.self)
        

            tableView.reloadData()
        }
    
    //MARK - add new category
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
            
        }
        
            alert.addAction(action)
            
            alert.addTextField { (field) in
                textField = field
                textField.placeholder = "add a new category"
            }
            present(alert, animated: true, completion: nil)
        }
    }


