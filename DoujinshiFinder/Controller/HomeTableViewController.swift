//
//  HomeTableViewController.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/12/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

//    var SauceySauce: Results<Sauce>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "InsideTableViewCell", bundle: nil), forCellReuseIdentifier: "CellCell")
        tableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCell", for: indexPath) as! InsideTableViewCell
        print("Working")
        
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }
    
    //MARK: - Add Button

    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add", message: "Insert the sauce you want info on", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add and Find", style: .default) { (Action) in
            if let ID = textfield.text {
                print(ID)
                print("Break your legs")
                URLCreation(with: ID)
            }
        }
        
        //adding a text field to our alert
        alert.addTextField { (AlertField) in
            //The placeholder of the text field
            AlertField.placeholder = "177013"
            
            //Bring the field function snad etc here
            textfield = AlertField
        }
        alert.addAction(action)
        present(alert ,animated: true,completion: nil)
        
        tableView.reloadData()
    }
    
    
    
}
