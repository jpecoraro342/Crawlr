//
//  NavigationController.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = navigationBarColor;
        self.navigationBar.tintColor = offWhiteColor;
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : offWhiteColor];
    }
}