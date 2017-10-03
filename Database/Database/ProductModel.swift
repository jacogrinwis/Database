//
//  ProductModel.swift
//  Database
//
//  Created by Jaco Grinwis on 02-10-17.
//  Copyright © 2017 Jaco Grinwis. All rights reserved.
//

import Foundation

typealias Product = (
    id: Int64?,
    name: String,
    description: String,
    price: Double,
    purchasedAt: Date,
    store: String,
    storeUrl: String,
    productUrl: String,
    thumbnail: String,
    createdAt: Date,
    updatedAt: Date
)
