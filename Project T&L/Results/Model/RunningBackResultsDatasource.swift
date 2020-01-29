//
//  RunningBackResultsDatasource.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/17/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class RunningBackResultsDatasource: Datasource {
    
    var catRunningBacks: [[RunningBack]] = {
        var listCatRunningBacks = [[RunningBack]] ()
        let defaults = UserDefaults.standard
        if let savedCatRunningBacks = defaults.object(forKey: "catRunningBacks") as? Data {
            listCatRunningBacks = NSKeyedUnarchiver.unarchiveObject(with: savedCatRunningBacks) as! [[RunningBack]]
        }
        
        return listCatRunningBacks
    }()
    
    var categoryIndex = Int()
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [RunningBackResultsCell.self]
    }
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if (catRunningBacks.count == 0 || catRunningBacks[categoryIndex].count == 0) {
            return 0
        }
        return catRunningBacks[categoryIndex][indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        //        readFromRosterFile()
        if (catRunningBacks.count == 0) {
            return 0
        }
        return catRunningBacks[categoryIndex].count
    }
    
}
