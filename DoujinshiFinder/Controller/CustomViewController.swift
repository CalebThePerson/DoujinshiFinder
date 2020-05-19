//
//  CustomViewController.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/13/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import UIKit
import SwipeMenuViewController
import RealmSwift

class CustomViewController: SwipeMenuViewController {
    
    @IBOutlet weak var SwipeMenuView: SwipeMenuView!
    
    var options = SwipeMenuViewOptions()
    var SauceID: Int?
    var tags: List<String>?
    
    var SelectedSauce: Sauce? {
        
        didSet{
            //AcquireData()
        }
    }
    
    let array = ["Details","Tags","Related"]
    let views = ["InfoUITableViewController()"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        swipeMenuView.dataSource = self
        swipeMenuView.delegate = self
        
        let options: SwipeMenuViewOptions = .init()
        
        swipeMenuView.reloadData(options: options)
        
        views.forEach { (view) in
            let vc = DetailViewController()
            let othervc = InfoUITableViewController()
            vc.SelectedSauce = SelectedSauce
            self.addChild(vc)
            self.addChild(othervc)
        }
        
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
            if index == 1 {
                var vc = InfoUITableViewController()
                return vc
                
            } else if index == 2 {
                var vc = InfoUITableViewController()
                vc.didMove(toParent: vc)
                return vc
            }
            else {
                var vc = DetailViewController()
                vc.didMove(toParent: vc)
                return vc
            }
    }
    
    
    func AcquireData() {
        
    }
    
    //    func reloadData(options: SwipeMenuViewOptions? = nil, isOrientationChange: Bool = false)
    

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
