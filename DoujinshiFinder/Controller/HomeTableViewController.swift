//
//  HomeTableViewController.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/12/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftDragAndDrop

class HomeTableViewController: UITableViewController {
    
    
    let realm = try! Realm()
    
    
    var cellHeightsDictionary: [IndexPath: CGFloat] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "InsideTableViewCell", bundle: nil), forCellReuseIdentifier: "CellCell")
        tableView.dataSource = self
        
        AcquireDATA()
        
        tableView.rowHeight = 50
    }
    
    var SauceySauce: Results<Sauce>?
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SauceySauce?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCell", for: indexPath) as! InsideTableViewCell
        
        
        if let sauce = SauceySauce?[indexPath.row] {
            cell.TheName.text = sauce.name
            let ID = String(sauce.id)
            cell.SauceNumbers.text = ID
        }
        return cell
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
        
        AcquireDATA()
    }
    
    
    //MARK: - Acquire DATA
    func AcquireDATA() {
        SauceySauce = realm.objects(Sauce.self)
        
        self.tableView.reloadData()
    }
}

//    func tableView(_ tableView: UITableView, moveDataItem from: IndexPath, to: IndexPath) {
//            let fromDataItem: DataItem = data.items[from.item]
//            data.items.remove(at: from.item)
//            data.items.insert(fromDataItem, at: to.item)
//        }
//










