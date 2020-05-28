//
//  Save and Such.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/12/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import Foundation
import RealmSwift

//The save funcitn we will call throughout the project
//Or we were suppose to meme
let realm = try! Realm()

func Save(sauce: Sauce) {
    do {
        try realm.write {
            realm.add(sauce)
        }
        print("saving")
    } catch {
        print("There was an error saving the sauce, \(error)")
    }
    print("saved")
    
}
