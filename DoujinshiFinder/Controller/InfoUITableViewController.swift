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

    let Defaults = UserDefaults.standard

    var SelectedSauce: Sauce? {
        didSet{
            print("1st")
            AcquireData()
            
            
        }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        print("Loaded")
//
//        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "Super")
//        tableView.dataSource = self
//
//        tableView.reloadData()
//
////        AcquireData()
//
//
//
//
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2nd")
        print("Loaded")
        
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "Super")
        tableView.dataSource = self
        

        
        tableView.reloadData()

//        AcquireData()
        print("Yeth")

        print("Yeth")

    }
    
    let realm = try! Realm()
    
    public var Tags: Results<NiceTags>?
    

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Started")
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Super", for: indexPath) as! DetailsTableViewCell
        
        if let TheTags = Tags?[indexPath.row] {
            cell.Inflabel.text = TheTags.tags
        }
        
        
        return cell
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let help = Tags?.count {
            print("yeth")
            return help
        } else {
            return 7
        }
    }
    

    
    var help: NiceTags?
    
    //MARK: - Data Manipulation
    
    func AcquireData() {
        if let Sauce = SelectedSauce {
            Tags = Sauce.tags.sorted(byKeyPath: "tags", ascending: true)
//            SelectedSauce?.tags.sorted(byKeyPath: "tags", ascending: true)
//            print(Tags)
            print(Tags?.count)
            
        }
        
        tableView.reloadData()
    }
    
    
    




}
