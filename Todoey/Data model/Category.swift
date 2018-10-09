//
//  Category.swift
//  Todoey
//
//  Created by Nivan Gujral on 9/19/18.
//  Copyright © 2018 Nivan Gujral. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    let array = Array<Int>()
}
