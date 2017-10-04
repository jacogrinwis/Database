//
//  ViewController.swift
//  Database
//
//  Created by Jaco Grinwis on 04-10-17.
//  Copyright © 2017 Jaco Grinwis. All rights reserved.
//

import Cocoa
import SQLite

class ViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // databaseInjection()
        
        if let productQuery:AnySequence<Row> = ProductEntity.shared.queryAll() {
            for eachProduct in productQuery {
                ProductEntity.shared.toString(product: eachProduct)
            }
        }
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    // MARK: - Database Injection
    func databaseInjection() {
        let product1Id = ProductEntity.shared.insert(
            name: "Nikon D800",
            description: "FX Camera",
            price: 4000.00,
            purchasedAt: nil,
            store: "KameraExpress",
            storeUrl: "http://www.kamera-express.nl/",
            productUrl: "http://www.kamera-express.nl/nikon-d800/",
            thumbnail: ""
        )
        print(product1Id!)
        
        let product2Id = ProductEntity.shared.insert(
            name: "Nikon D300S",
            description: "DX Camera",
            price: 1400.60,
            purchasedAt: nil,
            store: "KameraExpress",
            storeUrl: "http://www.kamera-express.nl/",
            productUrl: "http://www.kamera-express.nl/nikon-d300s/",
            thumbnail: ""
        )
        print(product2Id!)
        
        let product3Id = ProductEntity.shared.insert(
            name: "Nikon D3300",
            description: "DX Camera",
            price: 400.95,
            purchasedAt: nil,
            store: "CameraNU",
            storeUrl: "http://www.cameranu/",
            productUrl: "http://www.cameranu.nl/nikon-d3300/",
            thumbnail: ""
        )
        print(product3Id!)
    }
}

// MARK: - TableView
extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return ProductEntity.shared.count()!
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 17
    }
}

extension ViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TableCell"), owner: self) as? TableCellView {
            cell.idLabel.stringValue = "test"           // <- How do I get the contents from the database here?
            cell.nameLabel.stringValue = "test"         // <- And here
            cell.descriptionLabel.stringValue = "test"  // <- And here
            cell.priceLabel.stringValue = "test"        // <- And here
            cell.purchasedAtLabel.stringValue = "test"  // <- And here
            cell.storeLabel.stringValue = "test"        // <- And here
            cell.storeUrlLabel.stringValue = "test"     // <- And here
            cell.productUrlLabel.stringValue = "test"   // <- And here
            cell.thumbnailLabel.stringValue = "test"    // <- And here
            cell.createdAtLabel.stringValue = "test"    // <- And here
            cell.updatedAtLabel.stringValue = "test"    // <- And here
            return cell
        }
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        print(tableView.selectedRow)
    }
}
