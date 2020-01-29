//
//  CatDatasource.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/19/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  CatDatasource.swift
//  Project Madden
//
//  Created by Zeebo Gouldon on 4/19/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

/*
 -LBTAComponents License Agreement: (See below)
 */

class CatDatasource: Datasource {
    
    var categories: [String] = {
        var listCats = [String] ()
        let defaults = UserDefaults.standard
        if let savedCats = defaults.object(forKey: "allCategories") as? Data {
            listCats = NSKeyedUnarchiver.unarchiveObject(with: savedCats) as! [String]
        }
        
        return listCats
    }()
    
    var currCat = String()
    
//    override func headerClasses() -> [DatasourceCell.Type]? {
//        return [CatHeader.self]
//    }
//    override func footerClasses() -> [DatasourceCell.Type]? {
//        return [CatFooter.self]
//    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [CatCell.self]
    }
    
    //    override func item(_ indexPath: IndexPath) -> Any? {
    //        return users[indexPath.item]
    //    }
    //
    override func item(_ indexPath: IndexPath) -> Any? {
        if (categories.count <= 0) {
            return 0
        }
        return categories[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        //        readFromRosterFile()
        return categories.count
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


