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
//First
            AcquireData()
        }
    }
    
    let realm = try! Realm()
    
    var Tags: List<NiceTags>?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//3rd
        print("Loaded")
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "Super")
        tableView.dataSource = self

        //Returns nill even though i changed the variable in acquiredata
//        print(Tags)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.tableView.reloadData()
        }

    }
    
    
    //MARK: - Data Manipulation
    
    func AcquireData() {
//2nd
        if let Sauce = SelectedSauce {
            Tags = Sauce.tags
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//4th
        let cell = tableView.dequeueReusableCell(withIdentifier: "Super", for: indexPath) as! DetailsTableViewCell
        
        if let TheTags = Tags?[indexPath.row] {
            cell.Inflabel.text = TheTags.tags
        }
        
        
        return cell
    }
    
 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of row
//5th
        return Tags?.count ?? 7
    }
}
