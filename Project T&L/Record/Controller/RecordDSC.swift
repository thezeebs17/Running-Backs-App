////
////  RecordDSC.swift
////  Project T&L
////
////  Created by Zeebo Gouldon on 9/19/18.
////  Copyright © 2018 Zeebo Gouldon. All rights reserved.
////
//
////
////  RecordDSC.swift
////  Project Madden
////
////  Created by Zeebo Gouldon on 4/1/18.
////  Copyright © 2018 Zeebo Gouldon. All rights reserved.
////
//
///*
// -LBTAComponents License Agreement: (See below)
// */
//
//import Foundation
//import LBTAComponents
//import UIKit
//
///*
// -LBTAComponents License Agreement: (See below)
// */
//
//class RecordDSC: DatasourceController {
//    
//    var currCat = String()
//    var catIndex = Int()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.navigationItem.title = currCat
//        
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        collectionView?.backgroundColor = .white
//        print("(rateVC) catIndex:",catIndex)
//        //        print("***")
//        let homeDatasource = RecordDS()
//        homeDatasource.recDScatIndex = catIndex
//        self.datasource = homeDatasource
//    }
//    
//    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    //        return 0
//    //    }
//    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //        let cell =
//        let ctrlr = ReceiverRateVC()
//        let currPlayer = datasource?.item(indexPath) as! Player
//        
//        let ratio = currPlayer.getWRratio()
//        
//        ctrlr.navigationItem.title = currPlayer.name
//        ctrlr.catIndex = catIndex
//        
//        navigationController?.pushViewController(ctrlr, animated: true)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        /*
//         Cell formats get reused when displaying these cells on the screen.
//         The reason why I wrote this fn was so that the color for the
//         ratioLabel would be correct for each cell.
//         Without this fn, the color would be incorrect due to cells being
//         "recycled" and not creating new cells when different cells get
//         displayed.
//         (Hard to describe but you can see the difference if you comment
//         this function out... player cells with ratio values that are 0.00
//         and don't have an WRrateCount of 0 may end up having the ratioLabel
//         color in red or blue instead of black)
//         */
//        
//        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! RPlayerCell
//        
//        guard let player = cell.datasourceItem as? Player else { return cell}
//        let ratio = player.getWRratio()
//        if player.getWRrateCount() != 0 {
//            
//            if ratio < 0.80 {cell.ratioLabel.textColor = .red}
//            else if ratio >= 1.00 {cell.ratioLabel.textColor = .blue}
//            else {cell.ratioLabel.textColor = .black}
//        } else { cell.ratioLabel.textColor = .black}
//        
//        //        let player = cell.datasourceItem
//        return cell
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let height: CGFloat
//        let heightAdjust: CGFloat
//        
//        heightAdjust = 0; height = 70
//        
//        return CGSize(width: view.frame.width, height: height + heightAdjust)
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 50)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 50)
//    }
//    
//    
//    
//    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//    //        return CGSize(width: view.frame.width, height: 50)
//    //    }
//    //
//    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//    //        return CGSize(width: view.frame.width, height: 50)
//    //    }
//    
//    
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
//
