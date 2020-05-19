//
//  InfoUITableViewController.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/13/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import UIKit
import SwipeMenuViewController
import RealmSwift

class InfoUITableViewController: UITableViewController {
    
    
    var SelectedSauce: Sauce? {
        
        didSet{
            AcquireData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View initiated")
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "CellCell")
        tableView.dataSource = self
        
        
    }
    
    let realm = try! Realm()
    
    var TheSauce: List<NiceTags>?
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return TheSauce?.count ?? 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoiCell", for: indexPath) as! DetailsTableViewCell
        
        if let SauceTag = TheSauce?[indexPath.row].tags {
//            cell.Inflabel.text = SauceTag
            print(SauceTag)
        }
        
        return cell
    }
    
    
    
    
    //MARK: - Data Manipulation
    
    func AcquireData() {
        if let Name = SelectedSauce?.name {
            TheSauce = SelectedSauce!.tags
        }
        
        tableView.reloadData()
        print("reload Data")
    }
    
    
    
    
}
