//
//  CustomViewController.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/13/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import UIKit
import SwipeMenuViewController

class CustomViewController: SwipeMenuViewController {

    @IBOutlet weak var SwipeMenuView: SwipeMenuView!

    var options = SwipeMenuViewOptions()
    var SauceID: Int?

    let array = ["Details","Tags","Related"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        swipeMenuView.dataSource = self
        swipeMenuView.delegate = self

        let options: SwipeMenuViewOptions = .init()

        swipeMenuView.reloadData(options: options)
        

    }
    // MARK - SwipeMenuViewDelegate
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewWillSetupAt: currentIndex)
        print("will setup SwipeMenuView")
    }

    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewDidSetupAt: currentIndex)
        print("did setup SwipeMenuView")
    }

    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, willChangeIndexFrom: fromIndex, to: toIndex)
        print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }

    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, didChangeIndexFrom: fromIndex, to: toIndex)
        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    //MARK: - DataSource
    
    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
           return array.count
       }
//    DestinationVC.SelectedCategory = Categories?[indexPath.row]


       override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return array[index]
       }

       override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
           let vc = InfoUITableViewController()
        return vc
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

//extension CustomViewController: SwipeMenuViewDelegate {
//
//    // MARK - SwipeMenuViewDelegate
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
//        print("will setup SwipeMenuView")
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
//        print("did setup SwipeMenuView")
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
//        print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
//        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
//    }
//}

//extension CustomViewController: SwipeMenuViewDataSource {
//
//    //MARK - SwipeMenuViewDataSource
//    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
//        return array.count
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
//        return array[index]
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
//        let vc = CustomViewController()
//        return vc
//    }
//}
