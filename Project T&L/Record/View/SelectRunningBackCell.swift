//
//  SelectRunningBackCell.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/22/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  SelectQuarterbackCell.swift
//  Project Harbaugh
//
//  Created by Zeebo Gouldon on 8/5/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class SelectQuarterbackCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let runningBack = datasourceItem as? RunningBack else {return}
            nameLabel.text = "#\(runningBack.number) - \(runningBack.name)"
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Running Back Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .yellow
        return label
    }()
    
    // add in completion % rating as well
    
    var uiFeatureTopConst: CGFloat = 10
    var nameLabelLeftConst: CGFloat = 10
    var nameLabelWidthConst: CGFloat = 250
    var nameLabelHeightConst: CGFloat = 30
    
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        addSubview(nameLabel)
        
        nameLabel.anchor(topAnchor,
                         left: leftAnchor,
                         bottom: nil,
                         right: nil, // anchor to Rt-Hand stat corners later
            topConstant: uiFeatureTopConst,
            leftConstant: nameLabelLeftConst,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: nameLabelWidthConst,
            heightConstant: nameLabelHeightConst)
    }
    
    
    
}














