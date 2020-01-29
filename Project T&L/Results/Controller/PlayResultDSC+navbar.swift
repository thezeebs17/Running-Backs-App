//
//  PlayResultDSC+navbar.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/18/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

extension PlayResultsDatasourceController {
    
    func setUpNavigationBarItems() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharePressed))
        
    }
    
    @objc func sharePressed(sender: Any) {
        let defaults = UserDefaults.standard
        var playResults = [[PlayResult]]()
        if let savedPlayResults = defaults.object(forKey: "playResults") as? Data {
            playResults = NSKeyedUnarchiver.unarchiveObject(with: savedPlayResults) as! [[PlayResult]]
        }
        let fileName = "\(allCategories[categoryIndex]) - PBP Summary.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvText = "Play-By-Play Results,\(allCategories[categoryIndex])" + "\n\n"
        //        var csvText = "Name,DROP,INC,DBL,COM\n"
        csvText.append("Play #,BC,Play Rating,Yds Ran,Yds After Contact,Broken Tackle?,PPT?,Too Many Cutbacks?,Violent Finish?,Comments\n")
        //        for p in allPlayers {
        var playCount: Int = 0
        var ballCarrierString: String = ""
        var cutBackString: String = "/"
        var ydsRanString: String = "/"
        var ydsAfterContactString: String = "/"
        var violentFinishString: String = "/"
        var brokenTackleString: String = "/"
        var passProtectionString: String = "/"
        for result in playResults[categoryIndex] {
            playCount += 1
            let pStr = "\(playCount),"
            ballCarrierString = result.runningBackNumber
            if result.hadViolentFinish == "NO" {
                violentFinishString = "NO"
            } else if result.hadViolentFinish == "YES"{
                violentFinishString = "YES"
            } else {violentFinishString = "/"}
            if result.hadPassProtection == "NO" {
                passProtectionString = "NO"
            } else if result.hadPassProtection == "YES"{
                passProtectionString = "YES"
            } else {passProtectionString = "/"}
            if result.hadCutback == "NO" {
                cutBackString = "NO"
            } else if result.hadCutback == "YES"{
                cutBackString = "YES"
            } else {cutBackString = "/"}
            if result.hadBrokenTackle == "NO" {
                brokenTackleString = "NO"
            } else if result.hadBrokenTackle == "YES" {
                brokenTackleString = "YES"
            } else {brokenTackleString = "/"}
            //csvText.append("Play #,BC,Yds Ran,Yds After Contact,Broken Tackle?,PPT?,Too Many Cutbacks?,Violent Finish?\n")
            let newLine = pStr + "\(ballCarrierString),\(result.playRating),\(result.yardsRan),\(result.yardsAfterContact),\(brokenTackleString),\(passProtectionString),\(cutBackString),\(violentFinishString),\(result.comment)\n"
            csvText.append(newLine)
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
