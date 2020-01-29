//
//  TabBarController.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/9/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  CustomTabBarController.swift
//  Project Snapper Alpha v2.0
//
//  Created by Zeebo Gouldon on 1/4/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let resultsVC = UINavigationController(rootViewController: HomeDatasourceController())
        let recordView =  UINavigationController(rootViewController: CategoriesTableViewController()) // VC for Record
        let resultsVC = UINavigationController(rootViewController: ResultCategoriesDSC())
        recordView.tabBarItem.title = "Record"
        resultsVC.tabBarItem.title = "Results"
        recordView.tabBarItem.image = #imageLiteral(resourceName: "write_tab_icon")
        resultsVC.tabBarItem.image = #imageLiteral(resourceName: "results_tab_icon")
        
        //        let editPlayerView = UINavigationController(rootViewController: RosterEditPlayer())
        //        editPlayerView.tabBarItem.title = "Edit"
        //        editPlayerView.tabBarItem.image = #imageLiteral(resourceName: "roster2_tab_icon")
        
        viewControllers = [recordView, resultsVC]
        //        viewControllers = [recordView, editPlayerView, resultsVC]
        self.selectedIndex = 0
    }
    
    
    
    
}

