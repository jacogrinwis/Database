//
//  Database.swift
//  Database
//
//  Created by Jaco Grinwis on 02-10-17.
//  Copyright © 2017 Jaco Grinwis. All rights reserved.
//

import Foundation
import SQLite

class Database {
    static let shared = Database()
    public let connection: Connection?
    public let databaseFilename = "db.sqlite3"
    private init() {
        let databasePath = NSSearchPathForDirectoriesInDomains(
            .applicationSupportDirectory, .userDomainMask, true
            ).first! + "/" + Bundle.main.bundleIdentifier!
        
        do {
            try FileManager.default.createDirectory(
                atPath: databasePath, withIntermediateDirectories: true, attributes: nil
            )
        } catch {
            let nsError = error as NSError
            print("Cannot create the directory. Error is: \(nsError), \(nsError.userInfo)")
        }
        
        do {
            connection = try Connection("\(databasePath)/\(databaseFilename)")
        } catch {
            connection = nil
            let nsError = error as NSError
            print("Cannot connect to database. Error is: \(nsError), \(nsError.userInfo)")
        }
    }
}
