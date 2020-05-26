//
//  DetailViewController.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/14/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    let realm = try! Realm()
    let Defaults = UserDefaults.standard
    
    
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PageNumberLabel: UILabel!
    
    //Literally sometimes a hit or miss i genuinly dont fuckin know the fuck is wrong with this issue bois
    //If i print here it will run faster on start up, look at this later
        override func viewDidLoad() {
            super.viewDidLoad()
//            print("1st")

    
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print("2nd")

        
    }
    
    var SelectedSauce: Sauce? {
        
        didSet {
//            print("3rd")
            if let Sauce = SelectedSauce {
                var SauceName = Sauce.name
                Defaults.set(SauceName, forKey: "Name")
                var SaucePages = String(Sauce.pgs)
                Defaults.set(SaucePages, forKey: "Pages")
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        print("4th")
        
        NameLabel.text = Defaults.object(forKey: "Name") as! String
        PageNumberLabel.text = Defaults.object(forKey: "Pages") as! String
        
    }
    
    
    
    
    
    
    
    
}


