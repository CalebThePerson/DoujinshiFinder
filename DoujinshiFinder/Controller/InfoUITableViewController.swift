//
//  InfoUITableViewController.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/13/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import UIKit
import RealmSwift

class InfoUITableViewController: UITableViewController {


    var SelectedSauce: Sauce? {
        
        didSet{
            AcquireData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
            AcquireData()

        
        
    }
    
    let realm = try! Realm()
    
    var TheSauce: Results<Sauce>?
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    //MARK: - Data Manipulation
    
    func AcquireData() {
        if let Name = SelectedSauce?.name {
            TheSauce = realm.objects(Sauce.self).filter("name = \(Name)")

        }
        
        tableView.reloadData()
        print("reload Data")
    }




}
