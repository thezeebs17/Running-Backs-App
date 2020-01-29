//
//  RunningBackResultsCell.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/17/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

class RunningBackResultsCell: PlayResultsCell {
    
    override var datasourceItem: Any?  {
        didSet {
            guard let runningBack = datasourceItem as? RunningBack else { return }
            nameNumberLabel.text = "#\(runningBack.number) - \(runningBack.name)"
            yardsRanNumberLabel.text = String(runningBack.getTotalNumberOfYardsRan())
            playCountLabel.text = String(runningBack.snapCount)
            if runningBack.yardsAfterContact.count != 0 {
                yardsAfterContactNumberLabel.text = String(runningBack.getTotalNumberOfYardsAfterContact())
                yardsAfterContactNumberLabel.isHidden = false
                yardsAfterContactTitle.isHidden = false
            } else {
                yardsAfterContactNumberLabel.isHidden = true
                yardsAfterContactTitle.isHidden = true
            }
            if runningBack.hadBrokenTackleCount == 0 {
                brokenTackleTitle.isHidden = true
            } else {
                brokenTackleTitle.isHidden = false
                brokenTackleTitle.text = "BT - Y: \(runningBack.getNoBrokenTackleCount()) | N: \(runningBack.getNoBrokenTackleCount())"
            }
            if runningBack.hadPassProtectionCount == 0 {
                passProtectionTitle.isHidden = true
            } else {
                passProtectionTitle.isHidden = false
                passProtectionTitle.text = "PPT - Y: \(runningBack.getYesPassProtectionCount()) | N: \(runningBack.getNoPassProtectionCount())"
            }
            if runningBack.hadCutbackCount == 0 {
                cutbackTitle.isHidden = true
            } else {
                cutbackTitle.isHidden = false
                cutbackTitle.text = "CB - Y: \(runningBack.getYesCutbackCount()) | N: \(runningBack.getNoCutbackCount())"
            }
            if runningBack.hadViolentFinishCount == 0 {
                violentFinishTitle.isHidden = true
            } else {
                violentFinishTitle.isHidden = false
                violentFinishTitle.text = "VF - Y: \(runningBack.getYesViolentFinishCount()) | N: \(runningBack.getNoViolentFinishCount())"
            }
            playRatingLabel.text = "\(runningBack.getTotalPlayRatings())"
        }
    }
    
    var averageYardsPerCarryLabel: UILabel = {
        let label = getGrayUILabel(text: "Avg Yds")
        label.backgroundColor = .yellow
        label.textAlignment = .center
        return label
    }()
    
    var averageYardsRanNumberLabel: UILabel = {
        let label = getGrayUILabel(text: "##")
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var averageYACPerCarryLabel: UILabel = {
        let label = getGrayUILabel(text: "Avg YAC")
        label.backgroundColor = .yellow
        label.textAlignment = .center
        return label
    }()
    
    var averageYACRanNumberLabel: UILabel = {
        let label = getGrayUILabel(text: "##")
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        commentLabel.removeFromSuperview()
    }
    
}
