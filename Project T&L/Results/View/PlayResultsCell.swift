//
//  PlayResultsCell.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/13/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

func getResultsExtraRatingsTitle(text: String, textColor: UIColor, backgroundColor: UIColor) -> UILabel {
    let label = UILabel()
    label.backgroundColor = backgroundColor
    label.textColor = textColor
    label.font = UIFont(name: label.font.fontName, size: 12)
    label.textAlignment = .center
    label.text = text
    return label
}

let GREEN_UICOLOR_CONST = UIColor(r: 0, g: 150, b: 0)

class PlayResultsCell: StandardDatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let playResult = datasourceItem as? PlayResult else { return }
            nameNumberLabel.text = "#\(playResult.runningBackNumber) - \(playResult.runningBackName)"
            playCountLabel.text = playResult.playCount
            yardsRanNumberLabel.text = String(playResult.yardsRan)
            playRatingLabel.text = "\(playResult.playRating)"
            playRatingLabel.textColor = .white
            if playResult.playRating == -1 {
                playRatingLabel.backgroundColor = .red
            } else if playResult.playRating == 0 {
                playRatingLabel.backgroundColor = .black
            } else if playResult.playRating == 1 {
                playRatingLabel.backgroundColor = GREEN_UICOLOR_CONST
            } else {
                playRatingLabel.backgroundColor = .blue
            }
            
            if playResult.yardsAfterContact != "/" {
                yardsAfterContactNumberLabel.text = String(playResult.yardsAfterContact)
                yardsAfterContactNumberLabel.isHidden = false
                yardsAfterContactTitle.isHidden = false
            } else {
                yardsAfterContactNumberLabel.isHidden = true
                yardsAfterContactTitle.isHidden = true
            }
            if playResult.hadBrokenTackle == "N/A" {
                brokenTackleTitle.isHidden = true
            } else {
                brokenTackleTitle.isHidden = false
                if playResult.hadBrokenTackle == "NO" {
                    brokenTackleTitle.text = "No Broken Tackle"
                    brokenTackleTitle.textColor = .red
                } else {
                    brokenTackleTitle.text = "Broken Tackle"
                    brokenTackleTitle.textColor = GREEN_UICOLOR_CONST
                }
            }
            if playResult.hadPassProtection == "N/A" {
                passProtectionTitle.isHidden = true
            } else {
                passProtectionTitle.isHidden = false
                if playResult.hadPassProtection == "NO" {
                    passProtectionTitle.text = "Bad Pass Prot."
                    passProtectionTitle.textColor = .red
                } else {
                    passProtectionTitle.text = "Good Pass Prot."
                    passProtectionTitle.textColor = GREEN_UICOLOR_CONST
                }
            }
            if playResult.hadCutback == "N/A" {
                cutbackTitle.isHidden = true
            } else {
                cutbackTitle.isHidden = false
                if playResult.hadCutback == "NO" {
                    cutbackTitle.text = "Good Cutbacks"
                    cutbackTitle.textColor = GREEN_UICOLOR_CONST
                } else {
                    cutbackTitle.text = "Too Many Cutbacks"
                    cutbackTitle.textColor = .red
                }
            }
            if playResult.hadViolentFinish == "N/A" {
                violentFinishTitle.isHidden = true
            } else {
                violentFinishTitle.isHidden = false
                if playResult.hadViolentFinish == "NO" {
                    violentFinishTitle.text = "No Violent Finish"
                    violentFinishTitle.textColor = .red
                } else {
                    violentFinishTitle.text = "Violent Finish"
                    violentFinishTitle.textColor = GREEN_UICOLOR_CONST
                }
            }
            
            if (playResult.comment == "" || playResult.comment == "Comments") {
                commentLabel.text = ""
                commentLabel.backgroundColor = .clear
                commentLabel.isHidden = true
            } else if (playResult.comment != "" || playResult.comment != "Comments") {
                commentLabel.text = playResult.comment
                commentLabel.backgroundColor = UIColor(r: 240, g: 240, b: 240)
                commentLabel.isHidden = false
            }
            
         }
    }
    
    var playCountLabel: UILabel = {
        let label = UILabel()
        label.text = "##"
        label.textAlignment = .center
        label.backgroundColor = .orange
        return label
    }()
    
    var nameNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "## - First Last"
//        label.backgroundColor = .magenta
        return label
    }()
    
    var yardsRanTitle: UILabel = {
        let label = getGrayUILabel(text: "yds")
        label.backgroundColor = .yellow
        label.textAlignment = .center
        return label
    }()
    
    var yardsRanNumberLabel: UILabel = {
        let label = getGrayUILabel(text: "##")
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var yardsAfterContactTitle: UILabel = {
        let label = getGrayUILabel(text: "AC")
        label.backgroundColor = .yellow
        label.textAlignment = .center
        return label
    }()
    
    var yardsAfterContactNumberLabel: UILabel = {
        let label = getGrayUILabel(text: "##")
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var playRatingLabel: UILabel = {
        let label = getGrayUILabel(text: "##")
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var commentLabel: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(r: 240, g: 240, b: 240)
        textView.text = "Comments"
        //textView.textColor = .lightGray
        textView.font = UIFont(name: textView.font?.fontName as! String, size: 14)
        textView.isEditable = false
        return textView
    }()
    
    var brokenTackleTitle: UILabel = {
        return getResultsExtraRatingsTitle(text: "Broken Tackle",
                                           textColor: .magenta,
                                           backgroundColor: .clear)
    }()
    
    var passProtectionTitle: UILabel = {
        return getResultsExtraRatingsTitle(text: "Good Pass Prot.",
                                           textColor: GREEN_UICOLOR_CONST,
                                           backgroundColor: .clear)
    }()
    
    var violentFinishTitle: UILabel = {
        return getResultsExtraRatingsTitle(text: "Violent Finish",
                                           textColor: .blue,
                                           backgroundColor: .clear)
    }()
    
    var cutbackTitle: UILabel = {
        return getResultsExtraRatingsTitle(text: "Too Many Cutbacks",
                                           textColor: .red,
                                           backgroundColor: .clear)
    }()
    
    var nameNumberLabelWidthConst: CGFloat = 300
    var nameNumberLabelHeight: CGFloat = 20
    
    var playCountWidth: CGFloat = 40
    var playCountHeight: CGFloat = 20
    
    var labelTitleWidth: CGFloat = 30
    var labelTitleHeight: CGFloat = 20
    
    var yardsAfterContactTitleWidth: CGFloat = 40
    
    var playerNameWidth: CGFloat = 120
    var playerNameHeight: CGFloat = 25
    
    var extraPlayRatingsGapConst: CGFloat = 5
    
    var cutBackTitleWidthConst: CGFloat = 120
    var passProtectionTitleWidthConst: CGFloat = 100
    var violentFinishWidthConst: CGFloat = 80
    var brokenTackleWidthConst: CGFloat = 80
    
    override func setupViews() {
        super.setupViews()
        self.separatorLineView.isHidden = false
        nameLabel.removeFromSuperview()
        addSubview(playCountLabel)
        playCountLabel.anchor(centerYAnchor,
                              left: leftAnchor,
                              bottom: nil,
                              right: nil,
                              topConstant: playCountHeight * -1 / 2,
                              leftConstant: nameLabelLeftConst,
                              bottomConstant: 0,
                              rightConstant: nameLabelLeftConst,
                              widthConstant: playCountWidth,
                              heightConstant: playCountHeight)
        addSubview(playRatingLabel)
        playRatingLabel.anchor(topAnchor,
                               left: nil,
                               bottom: nil,
                               right: rightAnchor,
                               topConstant: nameLabelTopConst,
                               leftConstant: 0,
                               bottomConstant: 0,
                               rightConstant: extraPlayRatingsGapConst,
                               widthConstant: playCountWidth,
                               heightConstant: nameLabelHeightConst)
        addSubview(nameNumberLabel)
        nameNumberLabel.anchor(topAnchor,
                         left: playCountLabel.rightAnchor,
                         bottom: nil,
                         right: playRatingLabel.leftAnchor,
                         topConstant: nameLabelTopConst,
                         leftConstant: extraPlayRatingsGapConst,
                         bottomConstant: 0,
                         rightConstant: 0,
                         widthConstant: nameNumberLabelWidthConst,
                         heightConstant: nameLabelHeightConst)
        addSubview(yardsRanTitle)
        yardsRanTitle.anchor(nameNumberLabel.bottomAnchor,
                             left: nameNumberLabel.leftAnchor,
                             bottom: nil,
                             right: nil,
                             topConstant: nameLabelTopConst,
                             leftConstant: 0,
                             bottomConstant: 0,
                             rightConstant: 0,
                             widthConstant: labelTitleWidth,
                             heightConstant: labelTitleHeight)
        addSubview(yardsRanNumberLabel)
        yardsRanNumberLabel.anchor(yardsRanTitle.bottomAnchor,
                             left: yardsRanTitle.leftAnchor,
                             bottom: nil,
                             right: yardsRanTitle.rightAnchor,
                             topConstant: 0,
                             leftConstant: 0,
                             bottomConstant: 0,
                             rightConstant: 0,
                             widthConstant: labelTitleWidth,
                             heightConstant: labelTitleHeight)
        addSubview(yardsAfterContactTitle)
        yardsAfterContactTitle.anchor(yardsRanTitle.topAnchor,
                                      left: yardsRanTitle.rightAnchor,
                                      bottom: nil,
                                      right: nil,
                                      topConstant: 0,
                                      leftConstant: extraPlayRatingsGapConst,
                                      bottomConstant: 0,
                                      rightConstant: 0,
                                      widthConstant: labelTitleWidth,
                                      heightConstant: labelTitleHeight)
        addSubview(yardsAfterContactNumberLabel)
        yardsAfterContactNumberLabel.anchor(yardsAfterContactTitle.bottomAnchor,
                                   left: yardsAfterContactTitle.leftAnchor,
                                   bottom: nil,
                                   right: yardsAfterContactTitle.rightAnchor,
                                   topConstant: 0,
                                   leftConstant: 0,
                                   bottomConstant: 0,
                                   rightConstant: 0,
                                   widthConstant: labelTitleWidth,
                                   heightConstant: labelTitleHeight)
        addSubview(cutbackTitle)
        cutbackTitle.anchor(nameNumberLabel.bottomAnchor,
                            left: nil,
                            bottom: nil,
                            right: rightAnchor,
                            topConstant: nameLabelTopConst,
                            leftConstant: 0,
                            bottomConstant: 0,
                            rightConstant: 0,
                            widthConstant: cutBackTitleWidthConst,
                            heightConstant: labelTitleHeight)
        addSubview(violentFinishTitle)
        violentFinishTitle.anchor(cutbackTitle.bottomAnchor,
                            left: cutbackTitle.leftAnchor,
                            bottom: nil,
                            right: cutbackTitle.rightAnchor,
                            topConstant: extraPlayRatingsGapConst,
                            leftConstant: 0,
                            bottomConstant: 0,
                            rightConstant: 0,
                            widthConstant: cutBackTitleWidthConst,
                            heightConstant: labelTitleHeight)
        addSubview(brokenTackleTitle)
        brokenTackleTitle.anchor(nameNumberLabel.bottomAnchor,
                                 left: nil,
                                 bottom: nil,
                                 right: cutbackTitle.leftAnchor,
                                 topConstant: nameLabelTopConst,
                                 leftConstant: 0,
                                 bottomConstant: 0,
                                 rightConstant: extraPlayRatingsGapConst,
                                 widthConstant: cutBackTitleWidthConst,
                                 heightConstant: labelTitleHeight)
        addSubview(passProtectionTitle)
        passProtectionTitle.anchor(brokenTackleTitle.bottomAnchor,
                                  left: brokenTackleTitle.leftAnchor,
                                  bottom: nil,
                                  right: brokenTackleTitle.rightAnchor,
                                  topConstant: extraPlayRatingsGapConst,
                                  leftConstant: 0,
                                  bottomConstant: 0,
                                  rightConstant: 0,
                                  widthConstant: cutBackTitleWidthConst,
                                  heightConstant: labelTitleHeight)
        
        
        addSubview(commentLabel)
        commentLabel.anchor(playCountLabel.bottomAnchor,
                            left: playCountLabel.rightAnchor,
                            bottom: bottomAnchor,
                            right: rightAnchor,
                            topConstant: 10,
                            leftConstant: 5,
                            bottomConstant: 0,
                            rightConstant: 5,
                            widthConstant: cutBackTitleWidthConst,
                            heightConstant: labelTitleHeight)
        
        
    }
    
    
//    var brokenTackleTitle: UILabel = {
//        return getGrayUILabel(text: "BT?")
//    }()
//
//    var passProtectionTitle: UILabel = {
//        return getGrayUILabel(text: "PPT?")
//    }()
//
//    var violentFinishTitle: UILabel = {
//        return getGrayUILabel(text: "VF?")
//    }()
//
//    var cutbackTitle: UILabel = {
//        return getGrayUILabel(text: "CB?")
//    }()
    
    
}
