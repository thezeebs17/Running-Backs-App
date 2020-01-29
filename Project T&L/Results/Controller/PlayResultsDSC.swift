//
//  PlayResultsVC.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/13/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class PlayResultsDatasourceController: DatasourceController {
    
    
    
    var allCategories = [String]()
    //    var catPlayers = [String:Player]() // Dictionary, key == Category, vals = [Player]
    //    var catPlayers = [[Player]]()
    var runningBacks = [RunningBack]()
    var catRunningBacks = [[RunningBack]]()
    
    var categoryIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBarItems()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        if let savedCategories = defaults.object(forKey: "allCategories") as? Data {
            allCategories = NSKeyedUnarchiver.unarchiveObject(with: savedCategories) as! [String]
        }
        if let saveCatRunningBacks = defaults.object(forKey: "catRunningBacks") as? Data {
            catRunningBacks = NSKeyedUnarchiver.unarchiveObject(with: saveCatRunningBacks) as! [[RunningBack]]
        }
        if let savedRunningBacks = defaults.object(forKey: "runningBacks") as? Data {
            runningBacks = NSKeyedUnarchiver.unarchiveObject(with: savedRunningBacks) as! [RunningBack]
        } else {
            runningBacks = createRunningBacks()
            let saveRunningBacks = NSKeyedArchiver.archivedData(withRootObject: runningBacks)
            defaults.set(saveRunningBacks, forKey: "runningBacks")
        }
        
        
        let homeDatasource = PlayResultsDatasource()
        homeDatasource.categoryIndex = self.categoryIndex
        self.datasource = homeDatasource
        
    }
    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView(collectionView, cellForItemAt: indexPath))
//        
//        return cell
//    }
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 150
        var heightAdjust = 0
//         Dynamic Cell Sizing Algorithm
        if let user = self.datasource?.item(indexPath) as? PlayResult {
            // get estimation of height of cell based on user.bioText
            let approxWidthOfBioTextView = view.frame.width - 12 - 50 - 12
            let size = CGSize(width: approxWidthOfBioTextView, height: 1000)
            //let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.comment).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            heightAdjust = 20 + 20 + 12 + 12 + 2 // 66
            height = estimatedFrame.height
            if (user.comment == "" || user.comment == "Comments") {
                height = 150
                 return CGSize(width: view.frame.width, height: height)
            }
            return CGSize(width: view.frame.width, height: 150 + estimatedFrame.height)
        } else {
            return CGSize(width: view.frame.width, height: height)
            //Just use this if not using Dynamic Cell Sizing algorithm
        }
        
        
//
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
}
