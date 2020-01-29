//
//  ResultCategoriesDSC.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/9/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class ResultCategoriesDSC: CategoriesDSC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.title = "Results"
        setUpBarItems()
    }
    
    func setUpBarItems() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let segueSelectRunningBack = ResultSelectRunningBackDSC()
        // segue to tableview to choose which style of stats User wants to see
        let segueController = SelectStatsTypeTableViewController()
        segueController.categoryIndex = indexPath.row
        segueController.navigationItem.title = allCategories[indexPath.row]
        self.navigationController?.pushViewController(segueController, animated: true)
    }
}

