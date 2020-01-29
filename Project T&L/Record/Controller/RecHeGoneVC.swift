//
//  RecHeGoneVC.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/22/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  RecHeGoneVC.swift
//  Project Madden
//
//  Created by Zeebo Gouldon on 4/26/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit


class RecHeGoneVC: UIViewController {
    
    let warnLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .red
        label.numberOfLines = 2
        label.text = "Clear all Categories?\nThis action cannot be undone."
        return label
    }()
    
    let heGoneBtn: UIButton = {
        let btn = UIButton(type: .system)
        
        btn.backgroundColor = .red
        btn.tintColor = .white
        btn.setTitle("He Gone!", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.addTarget(self, action: #selector(heGonePressed), for: .touchUpInside)
        
        return btn
    }()
    
    @objc func heGonePressed(sender: UIButton) {
        let emptyCats = [String]()
        let emptyCatPlayers = [[RunningBack]]()
        let defaults = UserDefaults.standard
        let playResults = [[PlayResult]]()
        let undoHistory = [[PlayResult]]()
        // No need to load allCategories, allCatPlayers in...
        // just "NS Archive" "allCategories" to empty [String] array,
        // and similar process for "allCatPlayers" to empty [[Player]] array
        let saveCategories = NSKeyedArchiver.archivedData(withRootObject: emptyCats)
        let saveCatPs = NSKeyedArchiver.archivedData(withRootObject: emptyCatPlayers)
        let savePlayResults = NSKeyedArchiver.archivedData(withRootObject: playResults)
        let saveUndoHistory = NSKeyedArchiver.archivedData(withRootObject: undoHistory)
        defaults.set(saveCategories, forKey: "allCategories")
        defaults.set(saveCatPs, forKey: "catRunningBacks")
        defaults.set(savePlayResults, forKey: "playResults")
        defaults.set(saveUndoHistory, forKey: "undoHistory")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(warnLabel)
        self.view.addSubview(heGoneBtn)
        
        warnLabel.anchor(view.topAnchor,
                         left: view.leftAnchor,
                         bottom: nil,
                         right: view.rightAnchor,
                         topConstant: 100,
                         leftConstant: 10,
                         bottomConstant: 0,
                         rightConstant: 10,
                         widthConstant: 0,
                         heightConstant: 50)
        heGoneBtn.anchor(warnLabel.topAnchor,
                         left: warnLabel.leftAnchor,
                         bottom: nil,
                         right: nil,
                         topConstant: 100,
                         leftConstant: 125,
                         bottomConstant: 0,
                         rightConstant: 0,
                         widthConstant: 100,
                         heightConstant: 40)
    }
    
    
    
}


