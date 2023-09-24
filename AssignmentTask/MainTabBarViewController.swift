//
//  MainTabBarViewController.swift
//  AssignmentTask
//
//  Created by mymac on 21/09/23.
//

import Foundation
import UIKit

class MainTabBarViewControllerMainTabBarViewController: UITabBarController, UITabBarControllerDelegate
{
    @IBInspectable var initialIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        selectedIndex = initialIndex
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        if tabBarController.selectedIndex == 1 {
        }
        
        let homeController = HomeViewController()
        tabBarController.navigationController?.pushViewController(homeController, animated: false)
        
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
    }
}
