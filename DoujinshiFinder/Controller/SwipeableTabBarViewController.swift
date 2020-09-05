//
//  SwipeableTabBarViewController.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/23/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import UIKit
import  SwipeableTabBarController

class SwipeableTabBarViewController: SwipeableTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        swipeAnimatedTransitioning?.animationType = SwipeAnimationType.overlap
        
        // Do any additional setup after loading the view.
        print("order")

    }
    
    var SelectedSauce: Sauce? {
        didSet {
            //When set this function is called
            Data()
            TitleChanger()
        }
    }
    
    func Data(){
        //passes throuhg selected sauce to the corresponding views and populates them
        //This was the biggest issue i have ever encountreered in mu life
        let first_vc = self.viewControllers?.first as! DetailViewController
        let last_vc = self.viewControllers?.last as! InfoUITableViewController
        first_vc.navigationItem.title = "Details"
        last_vc.navigationItem.title = "Tags"
        first_vc.SelectedSauce = SelectedSauce
        last_vc.SelectedSauce = SelectedSauce
    }
    
    func TitleChanger(){
        if let Sauce = SelectedSauce {
            navigationItem.title = String(Sauce.id)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
