//
//  ViewController.swift
//  BucketList
//
//  Created by H on 9/11/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    var items = ["Go to the moon", "Eat a candy bar", "Swim in the Amazon", "Ride a bike in Tokyo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddEditItemSegue", sender: self)
    }
    
    // Edit functionality
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "AddEditItemSegue", sender: indexPath)
    }
    
    // Delete functionality
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    // Refactored the code below to be the one on line 77
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AddItemSegue" {
//            let navigationController = segue.destination as! UINavigationController
//            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
//            addItemTableViewController.delegate = self
//        } else if segue.identifier == "AddEditItemSegue" {
//            let navigationController = segue.destination as! UINavigationController
//            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
//            addItemTableViewController.delegate = self
//            
//            //            Don't understand this code'
//            let indexPath = sender as! NSIndexPath
//            let item = items[indexPath.row]
//            
//            addItemTableViewController.item = item
//            addItemTableViewController.indexPath = indexPath
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
        addItemTableViewController.delegate = self
        
        if sender is NSIndexPath {
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
        }
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        print("I'm the hidden controller, BUT I am responding to the cancel button press on the top view controller.")
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        
        if let ip = indexPath {
           items[ip.row] = text
        } else {
            items.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    

}

