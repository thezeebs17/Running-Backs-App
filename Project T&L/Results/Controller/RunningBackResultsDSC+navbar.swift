//
//  RunningBackResultsDSC+navbar.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/19/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

extension RunningBackResultsDatasourceController {
    
    func setUpNavigationBarItems() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharePressed))
        
    }
    
    @objc func sharePressed(sender: Any) {
        let defaults = UserDefaults.standard
        var catRunningBacks = [[RunningBack]]()
        if let savedCatRunningBacks = defaults.object(forKey: "catRunningBacks") as? Data {
            catRunningBacks = NSKeyedUnarchiver.unarchiveObject(with: savedCatRunningBacks) as! [[RunningBack]]
        }
        var resultCategories: [String] = ["Total Yds Ran",
                                      "Total # Carries",
                                      "Avg Yds per Carry",
                                      "Total # Yds After Contact",
                                      "Total # YAC Carries",
                                      "Avg YAC per YAC carry"]
        let fileName = "\(allCategories[categoryIndex]) - RB Summary.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvText = "Running Back Results,\(allCategories[categoryIndex])" + "\n\n"
        //        var csvText = "Name,DROP,INC,DBL,COM\n"
        csvText.append("Running Back,Snap Count,Rating,Rating/Snap Count,Total Yds Ran,Total # Carries,Avg Yds per Carry,Total # Yds After Contact,Total # YAC Carries,Avg YAC per YAC carry\n")
        //        for p in allPlayers {
        var ballCarrierString: String = ""
        var snapCountString: String = ""
        var totalPlayRatingString: String = ""
        var ydsRanTotal: String = "/"
        var ydsRanCarries: String = "/"
        var avgYdsPerCarry: String = "/"
        var ydsAfterContactTotal: String = "/"
        var ydsAfterContactCarries: String = "/"
        var avgYACperYACcarry: String = "/"
        
        // Second Base Criteria
        
        
        var passProtectionYesCount: String = "/"
        var passProtectionNoCount: String = "/"
        var cutBackYesCount: String = "/"
        var cutBackNoCount: String = "/"
        var brokenTackleYesCount: String = "/"
        var brokenTackleNoCount: String = "/"
        var violentFinishYesCount: String = "/"
        var violentFinishNoCount: String = "/"
        
        var passProtectionTotalCount: String = "/"
        var cutBackTotalCount: String = "/"
        var brokenTackleTotalCount: String = "/"
        var violentFinishTotalCount: String = "/"
        
        var averageRatingString = "/"
        var extraCriteriaCsvText = [String]()
        var extraCriteriaHeaderText = "Running Back,# PPT Yes,# PPT No,# CB Yes,# CB No,# BT Yes,# BT No,# VF Yes,# VF No\n"
        var extraExtraCriteriaCsvText = [String]()
        var extraExtraCriteriaHeaderText = "Running Back, Total # PPT, Total # CB, Total # BT, Total # VF\n"
        extraCriteriaCsvText.append(extraCriteriaHeaderText)
        extraExtraCriteriaCsvText.append(extraExtraCriteriaHeaderText)
        for runningBack in catRunningBacks[categoryIndex] {
            var baseCriteriaPstr = ""
            var extraCriteriaPstr = ""
            var extraExtraCriteriaPstr = ""
            // (top) base criteria portion
            ballCarrierString = "\(runningBack.number) - \(runningBack.name)"
            snapCountString = "\(runningBack.snapCount)"
            totalPlayRatingString = "\(runningBack.getTotalPlayRatings())"
            averageRatingString = "\(runningBack.getAveragePlayRating())"
            ydsRanTotal = String(runningBack.getTotalNumberOfYardsRan())
            ydsRanCarries = String(runningBack.getTotalNumberOfYardsRanCarries())
            avgYdsPerCarry = String(runningBack.getAverageYardsRanPerCarry())
            ydsAfterContactTotal = String(runningBack.getTotalNumberOfYardsAfterContact())
            ydsAfterContactCarries = String(runningBack.getTotalNumberOfYardsAfterContactCarries())
            avgYACperYACcarry = String(runningBack.getAverageYardsAfterContactPerContactCarry())
            
            // (bottom) extra criteria portion
            passProtectionYesCount = String(runningBack.getYesPassProtectionCount())
            passProtectionNoCount = String(runningBack.getNoPassProtectionCount())
            cutBackYesCount = String(runningBack.getYesCutbackCount())
            cutBackNoCount = String(runningBack.getNoCutbackCount())
            brokenTackleNoCount = String(runningBack.getNoBrokenTackleCount())
            brokenTackleYesCount = String(runningBack.getYesBrokenTackleCount())
            violentFinishNoCount = String(runningBack.getNoViolentFinishCount())
            violentFinishYesCount = String(runningBack.getYesViolentFinishCount())
            
            // (way bottom) extra extra crieteria portion
            passProtectionTotalCount = String(runningBack.getTotalPassProtectionCount())
            cutBackTotalCount = String(runningBack.getTotalCutbackCount())
            brokenTackleTotalCount = String(runningBack.getTotalBrokenTackleCount())
            violentFinishTotalCount = String(runningBack.getTotalViolentFinishCount())
            
            baseCriteriaPstr = "\(ballCarrierString),\(snapCountString),\(totalPlayRatingString),\(averageRatingString),\(ydsRanTotal),\(ydsRanCarries),\(avgYdsPerCarry),\(ydsAfterContactTotal),\(ydsAfterContactCarries),\(avgYACperYACcarry)"
            extraCriteriaPstr = "\(ballCarrierString),\(passProtectionYesCount),\(passProtectionNoCount),\(cutBackYesCount),\(cutBackNoCount),\(brokenTackleYesCount),\(brokenTackleNoCount),\(violentFinishYesCount),\(violentFinishNoCount)"
            extraExtraCriteriaPstr = "\(ballCarrierString),\(passProtectionTotalCount),\(cutBackTotalCount),\(brokenTackleTotalCount),\(violentFinishTotalCount)"
            
            
            extraCriteriaCsvText.append(extraCriteriaPstr + "\n")
            extraExtraCriteriaCsvText.append(extraExtraCriteriaPstr + "\n")
            let newLine = baseCriteriaPstr + "\n"
            csvText.append(newLine)
        }
        csvText.append("\n")
        
        for extra in extraCriteriaCsvText {
            csvText.append(extra)
        }
        for extraExtra in extraExtraCriteriaCsvText {
            csvText.append(extraExtra)
        }
        
        
        
        do {
            try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
            vc.excludedActivityTypes = [
                UIActivityType.assignToContact,
                UIActivityType.saveToCameraRoll,
                UIActivityType.postToFlickr,
                UIActivityType.postToVimeo,
                UIActivityType.postToTencentWeibo,
                UIActivityType.postToTwitter,
                UIActivityType.postToFacebook,
                
            ]
            
            present(vc, animated: true, completion: nil)
            if let popOver = vc.popoverPresentationController {
                popOver.sourceView = self.view
                //popOver.sourceRect =
                //popOver.barButtonItem
            }
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
    }
    
    
}
