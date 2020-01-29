////
////  NewCategory.swift
////  Project T&L
////
////  Created by Zeebo Gouldon on 9/19/18.
////  Copyright © 2018 Zeebo Gouldon. All rights reserved.
////
//
////
////  NewCategory.swift
////  Project Madden
////
////  Created by Zeebo Gouldon on 4/8/18.
////  Copyright © 2018 Zeebo Gouldon. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class NewCategory: UIViewController, UITextFieldDelegate {
//    
//    let catTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "New Category Name"
//        textField.textAlignment = .center
//        textField.backgroundColor = .yellow
//        return textField
//    }()
//    
//    var topConstCatTF: CGFloat = 0
//    var leftConstCatTF: CGFloat = 0
//    var widthCatTF: CGFloat = 0
//    var heightCatTF: CGFloat = 0
//    
//    // Screen width.
//    public var screenWidth: CGFloat {return UIScreen.main.bounds.width}
//    
//    // Screen height.
//    public var screenHeight: CGFloat {return UIScreen.main.bounds.height}
//    
//    func checkScreenSize() {
//        if isiPadDevice() {
//            
//        } else if isiPhonePlusDevice() {
//            
//        } else { // isiPhoneDevice()
//            
//        }
//        topConstCatTF = 150
//        leftConstCatTF = -80
//        widthCatTF = 200
//        heightCatTF = 50
//    }
//    
//    func isiPadDevice() -> Bool {
//        // iPad portrait: height, width = 1028.0, 768.0
//        //        sizeButtonFont(size: 17)
//        return screenHeight == 768.0 || screenWidth == 768.0
//        
//    }
//    
//    func isiPhoneDevice() -> Bool {
//        // iPhone portrait: height, width = 667.0, 375.0
//        //        sizeButtonFont(size: 15)
//        return screenHeight == 375.0 || screenWidth == 375.0
//        
//    }
//    
//    func isiPhonePlusDevice() -> Bool {
//        // iPhone Plus portrait: height, width = 414.0, 736.0
//        //        sizeButtonFont(size: 15)
//        return screenHeight == 414.0 || screenWidth == 414.0
//    }
//    
//    func setUpNavItems() {
//        let saveBtn = UIButton(type: .system)
//        saveBtn.setTitle("Save", for: .normal)
//        // make font bigger
//        //        saveBtn.titleLabel?.font = CGFont(
//        saveBtn.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: saveBtn)
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        //        textField.resignFirstResponder()
//        
//        self.view.endEditing(true) // Dismiss keyboard
//        saveCat()
//        return false
//    }
//    
//    @objc func savePressed(sender: UIButton) {
//        //        let defaults = UserDefaults.standard
//        //        var allCategories = [String] ()
//        //        if let savedCategories = defaults.object(forKey: "allCategories") as? Data {
//        //            allCategories = NSKeyedUnarchiver.unarchiveObject(with: savedCategories) as! [String]
//        //        }
//        //        if catTextField.hasText {
//        //
//        //        }
//        saveCat()
//    }
//    
//    // Saves the new category by appending to allCategories and ... etc
//    private func saveCat() {
//        if catTextField.hasText {
//            let defaults = UserDefaults.standard
//            var allCategories = [String] ()
//            if let savedCategories = defaults.object(forKey: "allCategories") as? Data {
//                allCategories = NSKeyedUnarchiver.unarchiveObject(with: savedCategories) as! [String]
//            }
//            allCategories.append(catTextField.text!)
//            catPlayersList() // gen players list for new cat
//            let saveCats = NSKeyedArchiver.archivedData(withRootObject: allCategories)
//            defaults.set(saveCats, forKey: "allCategories")
//        }
//        self.navigationController?.popViewController(animated: true)
//    }
//    
//    // Generates players list for new category in allCatPlayers
//    private func catPlayersList() {
//        let defaults = UserDefaults.standard
//        var allWRs = [Player] ()
//        var allCatPlayers = [[Player]]()
//        //        if let savedWRs = defaults.object(forKey: "allWRs") as? Data {
//        //            allWRs = NSKeyedUnarchiver.unarchiveObject(with: savedWRs) as! [Player]
//        //        } else {
//        allWRs = genWRsList()
//        //            let saveWRs = NSKeyedArchiver.archivedData(withRootObject: allWRs)
//        //            defaults.set(saveWRs, forKey: "allWRs")
//        //            UserDefaults.standard.synchronize()
//        //        }
//        if let savedCatPlayers = defaults.object(forKey: "allCatPlayers") as? Data {
//            allCatPlayers = NSKeyedUnarchiver.unarchiveObject(with: savedCatPlayers) as! [[Player]]
//            
//        }
//        allCatPlayers.append(allWRs)
//        let saveCatPlayers = NSKeyedArchiver.archivedData(withRootObject: allCatPlayers)
//        
//        defaults.set(saveCatPlayers, forKey: "allCatPlayers")
//        UserDefaults.standard.synchronize()
//        
//        
//        //        return allWRs
//    }
//    
//    
//    override func viewDidLoad() {
//        view.backgroundColor = .white
//        self.catTextField.delegate = self
//        view.addSubview(catTextField)
//        
//        checkScreenSize()
//        setUpNavItems()
//        catTextField.anchor(view.topAnchor, left: view.centerXAnchor, bottom: nil, right: nil, topConstant: topConstCatTF, leftConstant: leftConstCatTF, bottomConstant: 0, rightConstant: 0, widthConstant: widthCatTF, heightConstant: heightCatTF)
//    }
//}
//
//func genRBsList() -> [Player] {
//    let defaults = UserDefaults.standard
//    var allPlayers = [RunningBack](); var allWRs = [RunningBack]()
//    
//    if let savedPlayers = defaults.object(forKey: "allPlayers") as? Data {
//        allPlayers = NSKeyedUnarchiver.unarchiveObject(with: savedPlayers) as! [RunningBack]
//    }
//    for p in allPlayers {
//        if (p.position == "RB" || p.position == "FB") {
//            let newP = RunningBack(newName: p.name, newNumber: p.number)
//            allWRs.append(newP)
//            //             allWRs.append(p)
//            //            print("YO")
//        }
//        
//    }
//    return allWRs
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
