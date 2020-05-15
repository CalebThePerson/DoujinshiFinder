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

    @IBOutlet weak var NumberOfPagesLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AcquireData()

        // Do any additional setup after loading the view.
    }
    var SelectedSauce: Sauce? {
        
        didSet{
            AcquireData()
        }
    }
    
    var TheSauce: Results<Sauce>?
    var num: Int?
    

    
    
    func AcquireData() {
        TheSauce = realm.objects(Sauce.self).filter("name matches @%",SelectedSauce?.name)
        print(TheSauce)
    }

}
