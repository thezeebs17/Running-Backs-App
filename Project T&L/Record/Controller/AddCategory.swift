//
//  AddCategory.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/22/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  AddCategoryController.swift
//  Project Harbaugh
//
//  Created by Zeebo Gouldon on 8/3/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class AddCategoryController: UIViewController, UITextFieldDelegate {
    
    
    var categories = [String]()
    var runningBacks = [RunningBack]()
    var catRunningBacks = [[RunningBack]]()
    var playResults = [[PlayResult]]()
    
    var undoHistory = [[PlayResult]]()
    var redoHistory = [[PlayResult]]()
    
    // add text field, save Nav Button, save fn,
    
    var categoryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Category Name"
        textField.textAlignment = .center
        textField.autocapitalizationType = .words
        textField.backgroundColor = .yellow
        return textField
    }()
    
    var topConstCategoryTextField: CGFloat = 150
    var leftConstCategoryTextField: CGFloat = -100
    var widthCategoryTextField: CGFloat = 200
    var heightCategoryTextField: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCoreData()
        categoryTextField.delegate = self
        view.backgroundColor = .white
        navigationItem.title = "Add Category"
        setUpNavItems()
        setUpViews()
    }
    
    func setUpNavItems() {
        let saveBtn = UIButton(type: .system)
        saveBtn.setTitle("Save", for: .normal)
        // make font bigger
        //        saveBtn.titleLabel?.font = CGFont(
        saveBtn.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: saveBtn)
    }
    
    @objc func savePressed(sender: UIButton) {
        saveCategory()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //        textField.resignFirstResponder()
        self.view.endEditing(true) // Dismiss keyboard
        saveCategory()
        return false
    }
    
    private func saveCategory() {
        if categoryTextField.hasText {
            addCategoryToRunningBacks()
            addCategoryToPlayResults()
            let defaults = UserDefaults.standard
            categories.append(categoryTextField.text!)
            undoHistory.append([PlayResult]())
            redoHistory.append([PlayResult]())
            //            categoryPlayersList() // gen players list for new cat
            let saveCats = NSKeyedArchiver.archivedData(withRootObject: categories)
            let saveUndoHistory = NSKeyedArchiver.archivedData(withRootObject: undoHistory)
            let saveRedoHistory = NSKeyedArchiver.archivedData(withRootObject: redoHistory)
            defaults.set(saveCats, forKey: "allCategories")
            defaults.set(saveUndoHistory, forKey: "undoHistory")
            defaults.set(saveRedoHistory, forKey: "redoHistory")
            UserDefaults.standard.synchronize()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    private func addCategoryToRunningBacks() {
        let defaults = UserDefaults.standard
        catRunningBacks.append(createRunningBacks())
        let saveCatRunningBacks = NSKeyedArchiver.archivedData(withRootObject: catRunningBacks)
        defaults.set(saveCatRunningBacks, forKey: "catRunningBacks")
        UserDefaults.standard.synchronize()
    }
    
    private func addCategoryToPlayResults() {
        let defaults = UserDefaults.standard
        playResults.append([PlayResult]())
        let savePlayResults = NSKeyedArchiver.archivedData(withRootObject: playResults)
        defaults.set(savePlayResults, forKey: "playResults")
        UserDefaults.standard.synchronize()
    }
    
    func setUpViews() {
        view.addSubview(categoryTextField)
        categoryTextField.anchor(view.topAnchor,
                                 left: view.centerXAnchor,
                                 bottom: nil,
                                 right: nil,
                                 topConstant: topConstCategoryTextField,
                                 leftConstant: leftConstCategoryTextField,
                                 bottomConstant: 0,
                                 rightConstant: 0,
                                 widthConstant: widthCategoryTextField,
                                 heightConstant: heightCategoryTextField)
    }
    
    
    
    func loadCoreData() {
        let defaults = UserDefaults.standard
        
        if let savedAllCategories = defaults.object(forKey: "allCategories") as? Data {
            categories = NSKeyedUnarchiver.unarchiveObject(with: savedAllCategories) as! [String]
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
        if let savedRedoHistory = defaults.object(forKey: "redoHistory") as? Data {
            redoHistory = NSKeyedUnarchiver.unarchiveObject(with: savedRedoHistory) as! [[PlayResult]]
        }
    }
    
    
    
    
}




















