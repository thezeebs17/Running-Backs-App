//
//  CategoryCell.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/19/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  CatCell.swift
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

protocol CatCellDelegate: class {
    func delete(cell: CatCell)
}

class CatCell: DatasourceCell {
    
    weak var delegate: CatCellDelegate?
    
    override var datasourceItem: Any? {
        didSet {
            guard let catName = datasourceItem as? String else { return }
            catLabel.text = catName
        }
    }
    
    lazy var deleteBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.tintColor = .red
        button.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        button.addTarget(self, action: #selector(deletePressed), for: .touchUpInside)
        return button
    }()
    
    @objc func deletePressed(sender: UIButton) {
        delegate?.delete(cell: self)
    }
    
    var isEditing: Bool = false {
        didSet {
            deleteBtn.isHidden = !isEditing
        }
    }
    
    let catLabel: UILabel = {
        let label = UILabel()
        label.text = "Cat Name"
        //        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 23)
        //        label.backgroundColor = .green
        
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 200, g: 200, b: 200)
        addSubview(catLabel)
        addSubview(deleteBtn)
        catLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 60)
        deleteBtn.anchor(catLabel.topAnchor, left: catLabel.rightAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: -10, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        if isEditing == false {
            deleteBtn.isHidden = !isEditing
        }
    }
    
}

class CatHeader: DatasourceCell {
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "HOW VIOLENT CAN YOU BE?!"
        //        label.textColor = twitterBlue
        label.font = UIFont.systemFont(ofSize: 14)
        return label
        
    }()
    
    override func setupViews() {
        super.setupViews()
        //backgroundColor = .green
        addSubview(textLabel)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 5, widthConstant: 0, heightConstant: 0)
    }
    
}


class CatFooter: DatasourceCell {
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "MORE VIOLENCE!!"
        label.textColor = .cyan
        label.font = UIFont.systemFont(ofSize: 14)
        return label
        
    }()
    
    override func setupViews() {
        super.setupViews()
        //backgroundColor = .green
        addSubview(textLabel)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
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

