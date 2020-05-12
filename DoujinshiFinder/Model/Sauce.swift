//
//  Sauce.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/12/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import Foundation
import RealmSwift

class Sauce: Object {
    @objc dynamic var name: String = ""
    var tags = List<String>()
//    var Related = List<String>()
    @objc dynamic var pgs: Int = 0
    @objc dynamic var id: Int = 0
    
}
