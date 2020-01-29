////
////  RecordDS.swift
////  Project T&L
////
////  Created by Zeebo Gouldon on 9/19/18.
////  Copyright © 2018 Zeebo Gouldon. All rights reserved.
////
//
////
////  RecordDS.swift
////  Project Madden
////
////  Created by Zeebo Gouldon on 4/1/18.
////  Copyright © 2018 Zeebo Gouldon. All rights reserved.
////
//
//import Foundation
//import LBTAComponents
//import UIKit
//
///*
// -LBTAComponents License Agreement: (See below)
// */
//
//class RecordDS: RReceiversDS {
//    
//    var recDScatIndex = Int()
//    
//    lazy var wideReceivers: [Player] = {
//        //        var listPlayers = [Player]()
//        //        if let ourData = NSKeyedUnarchiver.unarchiveObject(with: file_Path) as? [Player] {
//        //            listPlayers = ourData
//        //        }
//        var listPlayers = [[Player]] ()
//        let defaults = UserDefaults.standard
//        //Unarchive saved list of Players
//        if let savedPlayers = defaults.object(forKey: "allCatPlayers") as? Data {
//            listPlayers = NSKeyedUnarchiver.unarchiveObject(with: savedPlayers) as! [[Player]]
//        }
//        print("(DS) catIndex:",recDScatIndex)
//        return listPlayers[recDScatIndex]
//    }()
//    
//    //    var players: [Player] = {
//    //        //        var listPlayers = [Player]()
//    //        //        if let ourData = NSKeyedUnarchiver.unarchiveObject(with: file_Path) as? [Player] {
//    //        //            listPlayers = ourData
//    //        //        }
//    //        var listPlayers = [Player] ()
//    //        let defaults = UserDefaults.standard
//    //        //Unarchive saved list of Players
//    //        if let savedPlayers = defaults.object(forKey: "allPlayers") as? Data {
//    //            listPlayers = NSKeyedUnarchiver.unarchiveObject(with: savedPlayers) as! [Player]
//    //        } else {
//    //            var allPlayers = readFromRosterFile()
//    //            if allPlayers.count > 0 {
//    //                let savePlayers = NSKeyedArchiver.archivedData(withRootObject: allPlayers)
//    //                defaults.set(savePlayers, forKey: "allPlayers")
//    //                UserDefaults.standard.synchronize()
//    //            }
//    //            listPlayers = allPlayers
//    //        }
//    //        return listPlayers
//    //    } ()
//    
//    override func item(_ indexPath: IndexPath) -> Any? {
//        if wideReceivers.count <= 0 { return 0 }
//        return wideReceivers[indexPath.item]
//    }
//    
//    override func numberOfItems(_ section: Int) -> Int {
//        return wideReceivers.count
//    }
//    
////    override func headerClasses() -> [DatasourceCell.Type]? {
////        return [RosterHeader.self]
////    }
////    override func footerClasses() -> [DatasourceCell.Type]? {
////        return [RosterFooter.self]
////    }
//    
//    override func cellClasses() -> [DatasourceCell.Type] {
//        return [RPlayerCell.self]
//    }
//}
//
///*
// ---LBTAComponents License Agreement:
// 
// Copyright (c) 2016 Brian Voong <bhlvoong@gmail.com>
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
// 
// --End LBTAComponents License Agreement
// 
// */
//
