//
//  SelectStatsTypeTVC.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/9/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  resultsNavViewController.swift
//  Project Snapper Alpha v2.0
//
//  Created by Zeebo Gouldon on 1/27/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import UIKit
import LBTAComponents

class SelectStatsTypeTableViewController: UITableViewController {
    
    let statsTypes: [String] = ["Play-By-Play","Running Back"]
    var headerTitle = String()
    
    var categoryIndex = Int()
    var categories = [String]()
    
    let headerBackgroundColor = UIColor.init(r: 240, g: 240, b: 240)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setUpNavigationBarItems()
        loadCoreData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StandardTableViewCell")
    }
    
    func loadCoreData() {
        let defaults = UserDefaults.standard
        if let savedCategories = defaults.object(forKey: "allCategories") as? Data {
            categories = NSKeyedUnarchiver.unarchiveObject(with: savedCategories) as! [String]
        }
    }
    
    func setUpNavigationBarItems() {
        let shareButton = UIButton(type: .system)
        shareButton.setTitle("Share", for: .normal)
        shareButton.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareButton)
        
    }
    
    @objc func sharePressed(sender: Any) {
        //let segueController = OptionsController()
        //self.navigationController?.pushViewController(segueController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statsTypes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandardTableViewCell")
        cell?.textLabel?.text = statsTypes[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        if indexPath.row == 0 {
            let segueController = PlayResultsDatasourceController()
            segueController.categoryIndex = self.categoryIndex
            segueController.navigationItem.title = "\(categories[categoryIndex]) : PBP"
            self.navigationController?.pushViewController(segueController, animated: true)
        } else {
            let segueController = RunningBackResultsDatasourceController()
            segueController.categoryIndex = self.categoryIndex
            segueController.navigationItem.title = "\(categories[categoryIndex]) : RB"
            self.navigationController?.pushViewController(segueController, animated: true)
        }
    }
    
}
