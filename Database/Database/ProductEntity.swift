//
//  ProductEntity.swift
//  Database
//
//  Created by Jaco Grinwis on 02-10-17.
//  Copyright © 2017 Jaco Grinwis. All rights reserved.
//

import Foundation
import SQLite

class ProductEntity {
    static let shared = ProductEntity()
    
    private let tblProduct = Table("tblProduct")
    
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    private let description = Expression<String>("description")
    private let price = Expression<Double>("price")
    private let purchasedAt = Expression<Date>("purchasedAt")
    private let store = Expression<String>("store")
    private let storeUrl = Expression<String>("storeUrl")
    private let productUrl = Expression<String>("productUrl")
    private let thumbnail = Expression<String>("thumbnail")
    private let createdAt = Expression<Date>("createdAt")
    private let updatedAt = Expression<Date>("updatedAt")
    
    private init() {
        do {
            if let connection = Database.shared.connection {
                try connection.run(tblProduct.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(self.id, primaryKey: true)
                    table.column(self.name)
                    table.column(self.description)
                    table.column(self.price)
                    table.column(self.purchasedAt)
                    table.column(self.store)
                    table.column(self.storeUrl)
                    table.column(self.productUrl)
                    table.column(self.thumbnail)
                    table.column(self.createdAt)
                    table.column(self.updatedAt)
                }))
                print("Created table tblProduct successfully")
            } else {
                print("Created table tblProduct failed.")
            }
        } catch {
            let nsError = error as NSError
            print("Created table tblProduct failed. Error is: \(nsError), \(nsError.userInfo)")
        }
    }
    
    func insert(name: String, description: String?, price: Double?, purchasedAt: Date?, store: String?, storeUrl: String?, productUrl: String?, thumbnail: String?) -> Int64? {
        do {
            let insert = tblProduct.insert(self.name <- name,
                                           self.description <- description ?? "",
                                           self.price <- price ?? 0.00,
                                           self.purchasedAt <- purchasedAt ?? Date(),
                                           self.store <- store ?? "",
                                           self.storeUrl <- storeUrl ?? "",
                                           self.productUrl <- productUrl ?? "",
                                           self.thumbnail <- thumbnail ?? "",
                                           self.createdAt <- Date(),
                                           self.updatedAt <- Date())
            let insertId = try Database.shared.connection!.run(insert)
            return insertId
        } catch {
            let nsError = error as NSError
            print("Cannot query all tblProduct. Error is: \(nsError), \(nsError.userInfo)")
            return nil
        }
    }
    
    func queryAll() -> AnySequence<Row>? {
        do {
            return try Database.shared.connection?.prepare(self.tblProduct)
        } catch {
            let nsError = error as NSError
            print("Created table tblProduct failed. Error is: \(nsError), \(nsError.userInfo)")
            return nil
        }
    }
    
    func getAll() -> [Product]? {
        var retArray = [Product]()
        do {
            for product in (try Database.shared.connection?.prepare(self.tblProduct))! {
                retArray.append(Product(id: product[id],
                                        name: product[name],
                                        description: product[description],
                                        price: product[price],
                                        purchasedAt: product[purchasedAt],
                                        store: product[store],
                                        storeUrl: product[storeUrl],
                                        productUrl: product[productUrl],
                                        thumbnail: product[thumbnail],
                                        createdAt: product[createdAt],
                                        updatedAt: product[updatedAt]))
            }
            return retArray
        } catch {
            let nsError = error as NSError
            print("Created table tblProduct failed. Error is: \(nsError), \(nsError.userInfo)")
            return nil
        }
    }
    
    func toString(product: Row) {
        print("""
            id: \(product[self.id]),
            name: \(product[self.name]),
            description: \(product[self.description]),
            price: \(product[self.price]),
            purchasedAt: \(product[self.purchasedAt]),
            store: \(product[self.store]),
            storeUrl: \(product[self.storeUrl]),
            productUrl: \(product[self.productUrl]),
            thumbnail: \(product[self.thumbnail]),
            createdAt: \(product[self.createdAt]),
            updatedAt: \(product[self.updatedAt])
            """)
    }
    
    func count() -> Int? {
        do {
            let count = try Database.shared.connection?.scalar(self.tblProduct.count)
            return count
        } catch {
            let nsError = error as NSError
            print("Could not count the rows in tblProduct. Error is \(nsError), \(nsError.userInfo)")
            return nil
        }
    }
}
