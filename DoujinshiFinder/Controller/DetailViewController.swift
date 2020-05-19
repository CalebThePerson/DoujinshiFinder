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
    
    var SauceName: String? {
        didSet{
            //            AcquireData()
        }
    }
    
    var SelectedSauce: Sauce? {
        
        didSet{
//            AcquireData()
        }
    }
    
    @IBOutlet weak var NumberOfPagesLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Did LOAD")
        
        AcquireData()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    var TheSauce: Results<Sauce>?
    var num: Int?
    
    
    
    
    
    func AcquireData() {
        if let Sauce = SelectedSauce {
            TitleLabel.text = Sauce.name
            NumberOfPagesLabel.text = String(Sauce.pgs)
        }
        print("DOne")
        
        
    }
    
}
