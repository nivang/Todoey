//
//  Item.swift
//  Todoey
//
//  Created by Nivan Gujral on 9/19/18.
//  Copyright © 2018 Nivan Gujral. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = true
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
