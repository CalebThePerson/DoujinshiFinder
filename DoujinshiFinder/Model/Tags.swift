//
//  Tags.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/15/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import Foundation
import RealmSwift

class NiceTags: Object {
    @objc dynamic var tags: String = ""
    var ParentSauce = LinkingObjects(fromType: Sauce.self, property: "tags")
}
