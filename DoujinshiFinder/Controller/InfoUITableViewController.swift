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
        didSet {
            print("1st")
            AcquireData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(Tags)
        print("yeth")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("3rd")
        print("Loaded")

        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "Super")
        tableView.dataSource = self

        //Returns nill even though i changed the variable in acquiredata
//        print(Tags)

        tableView.reloadData()
    }
    
    let realm = try! Realm()
    
    var Tags: List<NiceTags>?
    
    //MARK: - Data Manipulation
    
    func AcquireData() {
        print("2nd")
        if let Sauce = SelectedSauce {
            Tags = Sauce.tags
        }
        print(SelectedSauce?.tags)
        Tags = SelectedSauce?.tags
//            print(self.Tags)
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("4th")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Super", for: indexPath) as! DetailsTableViewCell
        
        //This isn't running, and just uses the default text inside the label
        if let TheTags = Tags?[indexPath.row] {
            cell.Inflabel.text = TheTags.tags
            print("WOrked?")
        }
        
        
        return cell
    }
    
 
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of row
        print("5th")
        //Returns 7 because tags is still nill
        return Tags?.count ?? 7
    }
}
