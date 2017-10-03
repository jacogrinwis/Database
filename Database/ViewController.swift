//
//  ViewController.swift
//  Database
//
//  Created by Jaco Grinwis on 02-10-17.
//  Copyright © 2017 Jaco Grinwis. All rights reserved.
//

import Cocoa
import SQLite

class ViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        let product1Id = ProductEntity.shared.insert(name: "Nikon D800",
                                                     description: "FX Camera",
                                                     price: 4000.00,
                                                     purchasedAt: nil,
                                                     store: "KameraExpress",
                                                     storeUrl: "http://www.kamera-express.nl/",
                                                     productUrl: "http://www.kamera-express.nl/nikon-d800/",
                                                     thumbnail: "")
        
        let product2Id = ProductEntity.shared.insert(name: "Nikon D300S",
                                                     description: "DX Camera",
                                                     price: 1400.60,
                                                     purchasedAt: nil,
                                                     store: "KameraExpress",
                                                     storeUrl: "http://www.kamera-express.nl/",
                                                     productUrl: "http://www.kamera-express.nl/nikon-d300s/",
                                                     thumbnail: "")
        
        let product3Id = ProductEntity.shared.insert(name: "Nikon D3300",
                                                     description: "DX Camera",
                                                     price: 400.95,
                                                     purchasedAt: nil,
                                                     store: "CameraNU",
                                                     storeUrl: "http://www.cameranu/",
                                                     productUrl: "http://www.cameranu.nl/nikon-d3300/",
                                                     thumbnail: "")
        */
        
        //print(ProductEntity.shared.getAll())
        
        /*
        if let productQuery: AnySequence<Row> = ProductEntity.shared.queryAll() {
            var productArray = [Any]()
            for eachProduct in productQuery {
                ProductEntity.shared.toString(product: eachProduct)
                //productArray.append(name: "")
                let newArray = Array(productQuery)
                print(newArray)
            }
        }
        */
        
        /*
        if let productQuery: AnySequence<Row> = ProductEntity.shared.queryAll() {
            let newArray = Array(productQuery)
            print(newArray)
        }
        */
 
        // AnySequence<Row>
        print(ProductEntity.shared.count()!)
        let obj = ProductEntity.shared.queryAll()
        print(obj!)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return ProductEntity.shared.count()!
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TableCell"), owner: self) as? TableCellView else { return nil }
        cell.idLabel.stringValue = ""
        cell.nameLabel.stringValue = ""
        cell.descriptionLabel.stringValue = ""
        cell.priceLabel.stringValue = ""
        cell.purchasedAtLabel.stringValue = ""
        cell.storeLabel.stringValue = ""
        cell.storeUrlLabel.stringValue = ""
        cell.productUrlLabel.stringValue = ""
        cell.thumbnailLabel.stringValue = ""
        cell.createdAtLabel.stringValue = ""
        cell.updatedAtLabel.stringValue = ""
        return cell
    }


}

