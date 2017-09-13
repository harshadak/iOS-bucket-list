//
//  AddItemTableViewController.swift
//  BucketList
//
//  Created by H on 9/11/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    // Creating the delegate
    
    weak var delegate: AddItemTableViewControllerDelegate?
    
    var item: String?
    var indexPath: NSIndexPath?

    @IBOutlet weak var itemTextField: UITextField!
    
    // Assigning the action of this button to the delegate
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    // Assigning the action of this button to the delegate
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.itemSaved(by: self, with: text, at: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
