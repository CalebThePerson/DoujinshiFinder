//
//  DeleteFunction.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/28/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import Foundation
import RealmSwift

func DeleteSauce(with TheSauce: Sauce) {
    do {
        try realm.write {
            realm.delete(TheSauce)
        }
    }
    catch {
        print(error)
    }
}
