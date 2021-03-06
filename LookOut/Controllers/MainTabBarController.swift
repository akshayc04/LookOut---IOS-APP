//
//  MainTabBarController.swift
//  LookOut
//
//  Created by Akshay on 3/6/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import UIKit
import Photos

class MainTabBarController: UITabBarController {
    
    let photoHelper = PhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoHelper.completionHandler = { image in
            PostService.create(for: image)
        }
    
        delegate = self
        tabBar.unselectedItemTintColor = .white
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
         if viewController.tabBarItem.tag == 1 {
            photoHelper.presentActionSheet(from: self)
            return false
         }
        
        return true
    }
}
