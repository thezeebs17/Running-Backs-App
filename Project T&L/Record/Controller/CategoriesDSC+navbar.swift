//
//  CategoriesDSC+navbar.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/19/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  CategoriesDSC+navbar.swift
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

extension CategoriesDSC {
    func setUpNavigationBarItems() {
        //        setUpLeftNavItems()
        let optBtn = UIButton(type: .system)
        optBtn.setTitle("Options", for: .normal)
        optBtn.addTarget(self, action: #selector(optPressed), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: optBtn)
        setUpRightNavItems()
        setUpRemainingNavItems()
    }
    
    private func setUpLeftNavItems() {
        //        let followButton = UIButton(type: .system)
        //        followButton.setImage(#imageLiteral(resourceName: "follow_logo").withRenderingMode(.alwaysOriginal), for: .normal)
        //        followButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        //        followButton.contentMode = .scaleAspectFit
        //        let editButton = UIButton(type: .system)
        //        editButton.setTitle("Edit", for: .normal)
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: editButton)
        navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    private func setUpRightNavItems() {
        //        let searchButton = UIButton(type: .system)
        //        searchButton.setImage(#imageLiteral(resourceName: "search_logo"), for: .normal)
        //        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        //        //navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        //        let composeButton = UIButton(type: .system)
        //        composeButton.setImage(#imageLiteral(resourceName: "tweet_logo").withRenderingMode(.alwaysOriginal), for: .normal)
        //        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        //        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton) ]
        let addButton = UIButton(type: .system)
        //        addButton.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControlState#>)
        addButton.setTitle("New", for: .normal)
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        addButton.addTarget(self, action: #selector(addPressed), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }
    
    @objc func addPressed(sender: UIButton) {
        let segueCtrlr = AddCategoryController()
        //        self.navigationController?.present(segueCtrlr, animated: true, completion: nil)
        self.navigationController?.pushViewController(segueCtrlr, animated: true)
    }
    
    private func setUpRemainingNavItems() {
        //        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "Big_C_Bear"))
        //        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        //        titleImageView.contentMode = .scaleAspectFit
        navigationItem.title = "Categories"
        //UIBarButtonSystemItem.search as! UIButton
        //navigationItem.rightBarButtonItems = [UIBarButtonSystemItem.search as! UIBarButtonItem, UIBarButtonSystemItem.compose as! UIBarButtonItem]
        //        navigationController?.navigationBar.backgroundColor = .blue
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    @objc func optPressed(sender: UIButton) {
        let segueCtrlr = RecHeGoneVC()
        self.navigationController?.pushViewController(segueCtrlr, animated: true)
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

