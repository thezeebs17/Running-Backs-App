//
//  SelectRunningBackDatasource.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/22/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  SelectQuarterbacksDatasource.swift
//  Project Harbaugh
//
//  Created by Zeebo Gouldon on 8/5/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class SelectRunningBacksDatasource: Datasource {
    
    var quarterbacks: [RunningBack] = {
        let defaults = UserDefaults.standard
        var players = [RunningBack]()
        if let savedRunningBacks = defaults.object(forKey: "runningBacks") as? Data {
            players = NSKeyedUnarchiver.unarchiveObject(with: savedRunningBacks) as! [RunningBack]
        } else {
            players = createRunningBacks()
            let saveQuarterbacks = NSKeyedArchiver.archivedData(withRootObject: players)
            defaults.set(saveQuarterbacks, forKey: "runningBacks")
        }
        
        return players
    }()
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [SelectQuarterbackCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return quarterbacks[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return quarterbacks.count
    }
    
    
    
    
    
    
}












