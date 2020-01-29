//
//  SelectRunningBackDSC.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/22/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  SelectQuarterbacksTableViewController.swift
//  Project Harbaugh
//
//  Created by Zeebo Gouldon on 8/5/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class SelectRunningBackDatasourceController: DatasourceController {
    
    var categoryIndex = Int()
    
    //    var quarterbacks = [Quarterback]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCoreData()
        self.datasource = SelectRunningBacksDatasource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let segueRateRunningBack = RateRunningBackViewController()
        segueRateRunningBack.runningBackIndex = indexPath.row
        segueRateRunningBack.categoryIndex = categoryIndex
        let selectedRunningBack = self.datasource?.item(indexPath) as! RunningBack
        //segueRateRunningBack.navigationItem.title = "#\(selectedRunningBack.number) - \(selectedRunningBack.name)"
        segueRateRunningBack.substituteTitle = "#\(selectedRunningBack.number) - \(selectedRunningBack.name)"
        segueRateRunningBack.runningBackNumber = selectedRunningBack.number
        segueRateRunningBack.runningBackName = selectedRunningBack.name
        navigationController?.pushViewController(segueRateRunningBack, animated: true)
    }
    
    func loadCoreData() {
        
        //        if let savedQuarterbacks = defaults.object(forKey: "quarterbacks") as? Data {
        //            quarterbacks = NSKeyedUnarchiver.unarchiveObject(with: savedQuarterbacks) as! [Quarterback]
        //        } else {
        //            createQuarterbacks()
        //        }
        
    }
}





















