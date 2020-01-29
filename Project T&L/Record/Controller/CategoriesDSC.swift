//
//  CategoriesDSC.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/19/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  CategoriesDSC.swift
//  Project Madden
//
//  Created by Zeebo Gouldon on 4/1/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

/*
 -LBTAComponents License Agreement: (See below)
 */

func createRunningBacks() -> [RunningBack]{
    var runningBacks = [RunningBack]()
    runningBacks.append(RunningBack(newName: "Brandon McIlwainn", newNumber: "5"))
    runningBacks.append(RunningBack(newName: "DeShawn Collins", newNumber: "00"))
    runningBacks.append(RunningBack(newName: "Patrick Laird", newNumber: "28"))
    runningBacks.append(RunningBack(newName: "Marcel Dancy", newNumber: "29"))
    runningBacks.append(RunningBack(newName: "Alex Netherda", newNumber: "31"))
    runningBacks.append(RunningBack(newName: "Christopher Brown Jr.", newNumber: "34"))
    runningBacks.append(RunningBack(newName: "CHEETAH", newNumber: "XX"))
    
    return runningBacks
}

class CategoriesDSC: DatasourceController {
    
//    var allPlayers = [Player]()
    
    var allCategories = [String]()
    //    var catPlayers = [String:Player]() // Dictionary, key == Category, vals = [Player]
//    var catPlayers = [[Player]]()
    var runningBacks = [RunningBack]()
    var catRunningBacks = [[RunningBack]]()
    
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
        
        let homeDatasource = CatDatasource()
        self.datasource = homeDatasource
        
    }
    // Enable editing.
    //    self.editor.setEditing(true, animated: true)
    //
    //    override func setEditing(_ editing: Bool, animated: Bool) {
    //        super.setEditing(editing, animated: animated)
    //        self.setEditing(true, animated: true)
    //    }
    //
    //    override func collection
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    //
    //    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    //        var supplementaryView = super.collectionView(collectionView,
    //                                                     viewForSupplementaryElementOfKind: kind,
    //                                                     at: indexPath)
    //        if supplementaryView != nil {
    //            return supplementaryView
    //        }
    //
    //        // Custom Section Header Code
    //        return super.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    //    }
    
    //    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! CatCell
    ////        cell.delegate = self as! CatCellDelegate
    //
    ////        return cell
    ////        var myButton: UIButton = UIButton(frame: CGRectMake(123, 123, 40, 40))
    ////        myButton.setTitle("X", for: .normal)
    //////        myButton.setBackgroundImage(UIImage.imageNamed("cellDeleteBtn.png"), forState: UIControlStateNormal)
    ////        myButton.setTag(indexPath.row)
    ////        myButton.addTarget(self, action: #selector(deleteCellFromButton), forControlEvents: .touchUpInside)
    //        cell.addSubview(myButton)
    //    }
    
    //    fileprivate var longPressGesture: UILongPressGestureRecognizer!
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
    //        self.collectionView?.addGestureRecognizer(longPressGesture)
    //    }
    
    
    //    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
    //        switch(gesture.state) {
    //
    //        case .began:
    //            guard let selectedIndexPath = self.collectionView?.indexPathForItem(at: gesture.location(in: self.collectionView)) else {
    //                break
    //            }
    //            self.collectionView?.beginInteractiveMovementForItem(at: selectedIndexPath)
    //        case .changed:
    //            self.collectionView?.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
    //        case .ended:
    //            self.collectionView?.endInteractiveMovement()
    //        default:
    //            self.collectionView?.cancelInteractiveMovement()
    //        }
    //    }
    
    //    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    //        print("Starting Index:",sourceIndexPath.item)
    //        let temp = allCategories[sourceIndexPath.item]
    //        allCategories[sourceIndexPath.item] = allCategories[destinationIndexPath.item]
    //        allCategories[destinationIndexPath.item] = temp
    //        let temp2 = catPlayers[sourceIndexPath.item]
    //        catPlayers[sourceIndexPath.item] = catPlayers[destinationIndexPath.item]
    //        catPlayers[destinationIndexPath.item] = temp2
    //
    //
    //
    //        let defaults = UserDefaults.standard
    //        let saveCats = NSKeyedArchiver.archivedData(withRootObject: allCategories)
    //        let saveCatPlayers = NSKeyedArchiver.archivedData(withRootObject: catPlayers)
    //        defaults.set(saveCats, forKey: "allCategories")
    //        defaults.set(saveCatPlayers, forKey: "allCatPlayers")
    //        UserDefaults.standard.synchronize()
    //        print("Ending Index:", destinationIndexPath.item)
    //        collectionView.reloadData()
    //        let cellDest = super.collectionView(collectionView, cellForItemAt: destinationIndexPath) as! CatCell
    //        cellDest.catLabel.text = allCategories[sourceIndexPath.item]
    //        let cellSrc = super.collectionView(collectionView, cellForItemAt: destinationIndexPath) as! CatCell
    //        cellSrc.catLabel.text = allCategories[sourceIndexPath.item]
    //    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        if self.isEditing {
        //            collectionView.deleteItems(at: [indexPath])
        //        } else {
        //        print("YO")
        let segueCtrlr = SelectRunningBackDatasourceController()
        //segueCtrlr.navigationItem.title =
        segueCtrlr.navigationItem.title = datasource?.item(indexPath) as! String
        segueCtrlr.categoryIndex = indexPath.item
        self.navigationController?.pushViewController(segueCtrlr, animated: true)
        //        }
    }
    
    //    override func setEditing(_ editing: Bool, animated: Bool ) {
    //        super.setEditing(editing, animated: animated)
    //        if let indexPaths = collectionView?.indexPathsForVisibleItems {
    //            for index in indexPaths {
    //                if let cell = collectionView?.cellForItem(at: index) as? CatCell {
    //                    cell.isEditing = editing
    //                }
    //            }
    //        }
    //    }
    
    //collection
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat
        
        //let user = self.datasource?.item(indexPath) as? User
        //print(user?.bioText)
        
        
        //        heightAdjust = 100; height = 70
        height = 80
        // Just use this if not using Dynamic Cell Sizing algorithm
        //        }
        
        //return CGSize(width: view.frame.width, height: estimatedFrame.height)
        
        return CGSize(width: view.frame.width, height: height)
        //}
        
        //return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
}

extension CategoriesDSC: CatCellDelegate {
    func delete(cell: CatCell) {
        //        print("ADRIAN")
        if let indexPath = collectionView?.indexPath(for: cell) {
            
            allCategories.remove(at: indexPath.item)
            let saveCats = NSKeyedArchiver.archivedData(withRootObject: allCategories)
            UserDefaults.standard.set(saveCats, forKey: "allCategories")
            
            //            collectionView?.deleteItems(at: [indexPath])
            collectionView?.reloadData()
            collectionView?.deleteSections([indexPath.item])
            
            
            //            UserDefaults.standard.synchronize()
            
        }
    }
}

/*
 ---LBTAComponents License Agreement:
 
 Copyright (c) 2016 Brian Voong <bhlvoong@gmail.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 --End LBTAComponents License Agreement
 
 */

