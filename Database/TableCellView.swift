//
//  TableCellView.swift
//  Database
//
//  Created by Jaco Grinwis on 02-10-17.
//  Copyright © 2017 Jaco Grinwis. All rights reserved.
//

import Cocoa

class TableCellView: NSTableCellView {

    @IBOutlet weak var idLabel: NSTextField!
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var priceLabel: NSTextField!
    @IBOutlet weak var purchasedAtLabel: NSTextField!
    @IBOutlet weak var storeLabel: NSTextField!
    @IBOutlet weak var storeUrlLabel: NSTextField!
    @IBOutlet weak var productUrlLabel: NSTextField!
    @IBOutlet weak var thumbnailLabel: NSTextField!
    @IBOutlet weak var createdAtLabel: NSTextField!
    @IBOutlet weak var updatedAtLabel: NSTextField!
}
