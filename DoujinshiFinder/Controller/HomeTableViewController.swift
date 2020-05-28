//
//  HomeTableViewController.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/12/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.




//All the print statments help decipher which functions are being ran and when

import UIKit
import RealmSwift

class HomeTableViewController: UITableViewController {
    
    
    let realm = try! Realm()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Using the custom cell we made rather than the default one
        tableView.register(UINib(nibName: "InsideTableViewCell", bundle: nil), forCellReuseIdentifier: "CellCell")
        tableView.dataSource = self
        
        //Calling this funciton to update the view and display the data
        AcquireDATA()
        
        tableView.rowHeight = 50
    }
    //A list of Sauce objects
    var SauceySauce: Results<Sauce>?
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Creates a number of rows corresponding to the amount of entries you have
        return SauceySauce?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCell", for: indexPath) as! InsideTableViewCell
        
        //Assinging the text and ID of the cell
        if let sauce = SauceySauce?[indexPath.row] {
            cell.TheName.text = sauce.name
            let ID = String(sauce.id)
            cell.SauceNumbers.text = ID
        }
        
        cell.textLabel?.isUserInteractionEnabled = false
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Whenever a row is selected it should perform a segue
        //that takes the user to the according sauce and tab bar view with the views Detail and Info
        
        performSegue(withIdentifier: "GoToCustom", sender: self)
        
        //Updates the view
        tableView.reloadData()
        
        //Deselects the row after it is tapped
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SwipeableTabBarViewController
        //Passes the selectedsauce you want to the SwipeTabBar controller
        if let indexPath = tableView.indexPathForSelectedRow {
            vc.SelectedSauce = self.SauceySauce?[indexPath.row]
        }
            
        

        
    }
    
    
    
    //MARK: - Add Button
    
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Search", message: "Insert the sauce you want info on", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add and Find", style: .default) { (Action) in
            //Doesn't let the user enter just nothing and doesn't break the code
            if textfield.text?.count == 0 {
                textfield.placeholder = "Enter Numbers dweeb"
                self.present(alert ,animated: true,completion: nil)
                
            }
            //saves the text field as an ID
            if let ID = textfield.text {
                print(ID)
                print("Break your legs")
                //Then runs URLCreatin that's inside API
                URLCreation(with: ID)
                //This delay stops this whole block from running too fast and not allowing the data to be reloaded
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                    self.AcquireDATA()
                }
                
                
                
            }
        }
        
        let action2 = UIAlertAction(title: "Dismiss", style: .default) { (Action) in
            //Dismisses if it was a mistake
        }
        //adding a text field to our alert
        alert.addTextField { (AlertField) in
            //The placeholder of the text field
            AlertField.placeholder = "177013"
            
            //Bring the field function snad etc here
            textfield = AlertField
        }
        alert.addAction(action2)
        alert.addAction(action)
        present(alert ,animated: true,completion: nil)
        
        
        
    }
    
    
    
    //MARK: - Acquire DATA
    func AcquireDATA() {
        //Sets Saucy sauce equal to all the sauce stored in the realm
        SauceySauce = realm.objects(Sauce.self)
        
        tableView.reloadData()
        print("reload Data")
    }
}












