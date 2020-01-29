//
//  CategoriesTVC.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/19/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class CategoriesTableViewController: UITableViewController {

    var headerTitle = String()
    
    var categoryIndex = Int()
    var categories = [String]()
    var catRunningBacks = [[RunningBack]]()
    var playResults = [[PlayResult]]()
    var undoHistory = [[PlayResult]]()
    
    let headerBackgroundColor = UIColor.init(r: 240, g: 240, b: 240)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setUpNavigationBarItems()
        self.navigationItem.title = "Categories"
        
        setUpNavigationBarItems()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StandardTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCoreData()
        self.tableView.reloadData()
    }
    
    func loadCoreData() {
        let defaults = UserDefaults.standard
        if let savedCategories = defaults.object(forKey: "allCategories") as? Data {
            categories = NSKeyedUnarchiver.unarchiveObject(with: savedCategories) as! [String]
        }
        if let savedCatRunningBacks = defaults.object(forKey: "catRunningBacks") as? Data {
            catRunningBacks = NSKeyedUnarchiver.unarchiveObject(with: savedCatRunningBacks) as! [[RunningBack]]
        }
        if let savedPlayResults = defaults.object(forKey: "playResults") as? Data {
            playResults = NSKeyedUnarchiver.unarchiveObject(with: savedPlayResults) as! [[PlayResult]]
        }
        if let savedUndoHistory = defaults.object(forKey: "undoHistory") as? Data {
            undoHistory = NSKeyedUnarchiver.unarchiveObject(with: savedUndoHistory) as! [[PlayResult]]
        }
    }
    
    func setUpNavigationBarItems() {
        let optBtn = UIButton(type: .system)
        optBtn.setTitle("Options", for: .normal)
        optBtn.addTarget(self, action: #selector(optPressed), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: optBtn)
        let addButton = UIButton(type: .system)
        addButton.setTitle("New", for: .normal)
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        addButton.addTarget(self, action: #selector(addPressed), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        
    }
    
    @objc func addPressed(sender: Any) {
        let segueController = AddCategoryController()
        self.navigationController?.pushViewController(segueController, animated: true)
    }
    
    @objc func optPressed(sender: UIButton) {
        let segueCtrlr = RecHeGoneVC()
        self.navigationController?.pushViewController(segueCtrlr, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    // Delete selected row in Category Table View
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            
            // Delete the row from the data source
            categories.remove(at: indexPath.row)
            catRunningBacks.remove(at: indexPath.row)
            undoHistory.remove(at: indexPath.row)
            playResults.remove(at: indexPath.row)
            
            let defaults = UserDefaults.standard
            let saveCategories = NSKeyedArchiver.archivedData(withRootObject: categories)
            let saveCatRunningBacks = NSKeyedArchiver.archivedData(withRootObject: catRunningBacks)
            let savePlayResults = NSKeyedArchiver.archivedData(withRootObject: playResults)
            let saveUndoHistory = NSKeyedArchiver.archivedData(withRootObject: undoHistory)
            
            defaults.set(saveCategories, forKey: "allCategories")
            defaults.set(saveCatRunningBacks, forKey: "catRunningBacks")
            defaults.set(savePlayResults, forKey: "playResults")
            defaults.set(saveUndoHistory, forKey: "undoHistory")
            
            UserDefaults.standard.synchronize()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandardTableViewCell")
        cell?.textLabel?.text = categories[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueCtrlr = SelectRunningBackDatasourceController()
        //segueCtrlr.navigationItem.title =
        segueCtrlr.navigationItem.title = categories[indexPath.row]
        segueCtrlr.categoryIndex = indexPath.row
        self.navigationController?.pushViewController(segueCtrlr, animated: true)
    }
}
