//
//  StandardCells.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/9/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

//
//  R_PhaseCell.swift
//  Project Snapper Alpha v2.0
//
//  Created by Zeebo Gouldon on 1/27/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import UIKit
import LBTAComponents

// standard helper functions for UILabels:

func threeWayBoolSegmentControlDefault() -> UISegmentedControl {
    let segmentControl = UISegmentedControl()
    segmentControl.insertSegment(withTitle: "YES", at: 0, animated: true)
    segmentControl.insertSegment(withTitle: "NO", at: 0, animated: true)
    segmentControl.insertSegment(withTitle: "N/A", at: 0, animated: true)
    segmentControl.selectedSegmentIndex = 0
    return segmentControl
}

func getGrayUILabel(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.adjustsFontSizeToFitWidth = true
    label.textColor = .gray
    //label.backgroundColor = .cyan
    
    return label
}

class StandardTableViewCell: UITableViewCell {
    
    var label = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //reuseIdentifier = "R_PhaseCell"
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class StandardDatasourceCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let name = datasourceItem as? String else { return }
            nameLabel.text = name
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    var nameLabelTopConst: CGFloat = 5
    var nameLabelLeftConst: CGFloat = 10
    var nameLabelWidthConst: CGFloat = 40
    var nameLabelHeightConst: CGFloat = 30
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        backgroundColor = .white
        addSubview(nameLabel)
        nameLabel.anchor(topAnchor,
                         left: leftAnchor,
                         bottom: nil,
                         right: rightAnchor,
                         topConstant: nameLabelTopConst,
                         leftConstant: nameLabelLeftConst,
                         bottomConstant: 0,
                         rightConstant: 0,
                         widthConstant: nameLabelWidthConst,
                         heightConstant: nameLabelHeightConst)
    }
    
    
}










