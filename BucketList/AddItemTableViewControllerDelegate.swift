//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by H on 9/12/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import Foundation

// Creating the protocol so that the delegate knows that they need to run these functions

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
