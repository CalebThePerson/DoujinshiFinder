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
        swipeAnimatedTransitioning?.animationType = SwipeAnimationType.sideBySide
//        isCyclingEnabled = true
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
