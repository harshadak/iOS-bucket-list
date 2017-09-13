//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by H on 9/12/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import Foundation

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
