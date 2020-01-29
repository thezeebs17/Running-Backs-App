//
//  PlayResultsDatasource.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/13/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class PlayResultsDatasource: Datasource {
    
    var playResults: [[PlayResult]] = {
        var listPlayResults = [[PlayResult]] ()
        let defaults = UserDefaults.standard
        if let savedPlayResults = defaults.object(forKey: "playResults") as? Data {
            listPlayResults = NSKeyedUnarchiver.unarchiveObject(with: savedPlayResults) as! [[PlayResult]]
        }
        
        return listPlayResults
    }()
    
    var categoryIndex = Int()
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [PlayResultsCell.self]
    }
    

    override func item(_ indexPath: IndexPath) -> Any? {
        if (playResults.count == 0 || playResults[categoryIndex].count == 0) {
            return 0
        }
        return playResults[categoryIndex][indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        //        readFromRosterFile()
        if (playResults.count == 0) {
            return 0
        }
        return playResults[categoryIndex].count
    }
}
