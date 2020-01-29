//
//  RunningBack.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/15/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

struct RunningBackKeys {
    static let name = "name"
    static let number = "number"
    static let yardsRan = "yardsRan"
    static let yardsAfterContact = "yardsAfterContact"
    static let snapCount = "snapCount"
    static let hadBrokenTackle = "hadBrokenTackle"
    static let hadPassProtection = "hadPassProtection"
    static let hadViolentFinish = "hadViolentFinish"
    static let hadCutback = "hadCutback"
    static let hadBrokenTackleHistory = "hadBrokenTackleHistory"
    static let hadPassProtectionHistory = "hadPassProtectionHistory"
    static let hadViolentFinishHistory = "hadViolentFinishHistory"
    static let hadCutbackHistory = "hadCutbackHistory"
    static let playRatings = "playRatings"
}

class RunningBack: NSObject, NSCoding {
    
    private var _name: String!
    private var _number: String!
    
    private var _yardsRan: [String]!
    private var _yardsAfterContact: [String]!
    private var _playRatings: [Int]!
    
    private var _snapCount: Int!
    
    // The following var's need -1 for Fail, 0 for N/A, +1 for Success
    private var _hadBrokenTackleCount: Int!
    private var _hadPassProtectionCount: Int!
    private var _hadViolentFinishCount: Int!
    private var _hadCutbackCount: Int!
    // Need 3-D array for each
    // Outmost array for category
    // middle array for play #
    // Innermost array for result (N/A for not applicable,
    
    private var _hadBrokenTackleHistory: [String]!
    private var _hadPassProtectionHistory: [String]!
    private var _hadViolentFinishHistory: [String]!
    private var _hadCutbackHistory: [String]!
    
    override init() {}
    
    required init?(coder aDecoder: NSCoder) {
        if let nameObj = aDecoder.decodeObject(forKey: RunningBackKeys.name) as? String {
            _name = nameObj
        }
        if let numberObj = aDecoder.decodeObject(forKey: RunningBackKeys.number) as? String {
            _number = numberObj
        }
        if let yardsRanObj = aDecoder.decodeObject(forKey: RunningBackKeys.yardsRan) as? [String] {
            _yardsRan = yardsRanObj
        }
        if let yardsAfterContactObj = aDecoder.decodeObject(forKey: RunningBackKeys.yardsAfterContact) as? [String] {
            _yardsAfterContact = yardsAfterContactObj
        }
        if let snapCountObj = aDecoder.decodeObject(forKey: RunningBackKeys.snapCount) as? Int {
            _snapCount = snapCountObj
        }
        if let hadBrokenTackleObj = aDecoder.decodeObject(forKey: RunningBackKeys.hadBrokenTackle) as? Int {
            _hadBrokenTackleCount = hadBrokenTackleObj
        }
        if let hadCutbackObj = aDecoder.decodeObject(forKey: RunningBackKeys.hadCutback) as? Int {
            _hadCutbackCount = hadCutbackObj
        }
        if let hadPassProtectionObj = aDecoder.decodeObject(forKey: RunningBackKeys.hadPassProtection) as? Int {
            _hadPassProtectionCount = hadPassProtectionObj
        }
        if let hadViolentFinishObj = aDecoder.decodeObject(forKey: RunningBackKeys.hadViolentFinish) as? Int {
            _hadViolentFinishCount = hadViolentFinishObj
        }
        
        if let hadBrokenTackleObj = aDecoder.decodeObject(forKey: RunningBackKeys.hadBrokenTackleHistory) as? [String] {
            _hadBrokenTackleHistory = hadBrokenTackleObj
        }
        if let hadCutbackObj = aDecoder.decodeObject(forKey: RunningBackKeys.hadCutbackHistory) as? [String] {
            _hadCutbackHistory = hadCutbackObj
        }
        if let hadPassProtectionObj = aDecoder.decodeObject(forKey: RunningBackKeys.hadPassProtectionHistory) as? [String] {
            _hadPassProtectionHistory = hadPassProtectionObj
        }
        if let hadViolentFinishObj = aDecoder.decodeObject(forKey: RunningBackKeys.hadViolentFinishHistory) as? [String] {
            _hadViolentFinishHistory = hadViolentFinishObj
        }
        
        if let playRatingsObj = aDecoder.decodeObject(forKey: RunningBackKeys.playRatings) as? [Int] {
            _playRatings = playRatingsObj
        }
        
    }
    
    init(newName: String, newNumber: String) {
        super.init()
        self._name = newName
        self._number = newNumber
        self._snapCount = 0
        self._yardsRan = [String]()
        self._yardsAfterContact = [String]()
        self._hadViolentFinishCount = 0
        self._hadPassProtectionCount = 0
        self._hadCutbackCount = 0
        self._hadBrokenTackleCount = 0
        self._hadBrokenTackleHistory = [String]()
        self._hadPassProtectionHistory = [String]()
        self._hadCutbackHistory = [String]()
        self._hadViolentFinishHistory = [String]()
        self._playRatings = [Int]()
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(_name, forKey: RunningBackKeys.name)
        aCoder.encode(_number, forKey: RunningBackKeys.number)
        aCoder.encode(_yardsRan, forKey: RunningBackKeys.yardsRan)
        aCoder.encode(_snapCount, forKey: RunningBackKeys.snapCount)
        aCoder.encode(_yardsAfterContact, forKey: RunningBackKeys.yardsAfterContact)
        aCoder.encode(_hadBrokenTackleCount, forKey: RunningBackKeys.hadBrokenTackle)
        aCoder.encode(_hadCutbackCount, forKey: RunningBackKeys.hadCutback)
        aCoder.encode(_hadPassProtectionCount, forKey: RunningBackKeys.hadPassProtection)
        aCoder.encode(_hadViolentFinishCount, forKey: RunningBackKeys.hadViolentFinish)

        aCoder.encode(_hadPassProtectionHistory, forKey: RunningBackKeys.hadPassProtectionHistory)
        aCoder.encode(_hadCutbackHistory, forKey: RunningBackKeys.hadCutbackHistory)
        aCoder.encode(_hadBrokenTackleHistory, forKey: RunningBackKeys.hadBrokenTackleHistory)
        aCoder.encode(_hadViolentFinishHistory, forKey: RunningBackKeys.hadViolentFinishHistory)
        
        aCoder.encode(_playRatings, forKey: RunningBackKeys.playRatings)

    }
    
    
    
    var name: String {
        get {return _name}
        set {_name = newValue}
    }
    
    var number: String {
        get {return _number}
        set { _number = newValue}
    }
    
    var yardsRan: [String] {
        get {return _yardsRan}
        set { _yardsRan = newValue}
    }
    
    var yardsAfterContact: [String] {
        get {return _yardsAfterContact}
        set { _yardsAfterContact = newValue}
    }
    
    var snapCount: Int {
        get {return _snapCount}
        set {_snapCount = newValue}
    }
    
    var hadBrokenTackleCount: Int {
        get {return _hadBrokenTackleCount}
        set { _hadBrokenTackleCount = newValue}
    }
    
    var hadCutbackCount: Int {
        get {return _hadCutbackCount}
        set { _hadCutbackCount = newValue}
    }
    
    var hadPassProtectionCount: Int {
        get {return _hadPassProtectionCount}
        set { _hadPassProtectionCount = newValue}
    }
    
    var hadViolentFinishCount: Int {
        get {return _hadViolentFinishCount}
        set { _hadViolentFinishCount = newValue}
    }
    
    var hadBrokenTackleHistory: [String] {
        get {return _hadBrokenTackleHistory}
        set { _hadBrokenTackleHistory = newValue}
    }
    
    var hadCutbackHistory: [String] {
        get {return _hadCutbackHistory}
        set { _hadCutbackHistory = newValue}
    }
    
    var hadPassProtectionHistory: [String] {
        get {return _hadPassProtectionHistory}
        set { _hadPassProtectionHistory = newValue}
    }
    
    var hadViolentFinishHistory: [String] {
        get {return _hadViolentFinishHistory}
        set { _hadViolentFinishHistory = newValue}
    }
    
    var playRatings: [Int] {
        get {return _playRatings}
        set {_playRatings = newValue}
    }
    
    func getTotalPlayRatings() -> Int {
        var totalRating = 0
        for rating in playRatings {
            totalRating += rating
        }
        return totalRating
    }
    
    func getAveragePlayRating() -> Double {
        if playRatings.count == 0 {return 0.0}
        let result = Double(getTotalPlayRatings()) / Double(playRatings.count)
        return Double(round(100*result) / 100)
    }
    
    func getTotalPassProtectionCount() -> Int {
        return self.getYesPassProtectionCount() + self.getNoPassProtectionCount()
    }
    
    func getYesPassProtectionCount() -> Int {
        var count = 0
        for result in self.hadPassProtectionHistory {
            if result == "YES" {
                count += 1
            }
        }
        return count
    }
    
    func getNoPassProtectionCount() -> Int {
        var count = 0
        for result in self.hadPassProtectionHistory {
            if result == "NO" {
                count += 1
            }
        }
        return count
    }
    
    func getTotalBrokenTackleCount() -> Int {
        return self.getYesBrokenTackleCount() + self.getNoBrokenTackleCount()
    }
    
    func getYesBrokenTackleCount() -> Int {
        var count = 0
        for result in self.hadBrokenTackleHistory {
            if result == "YES" {
                count += 1
            }
        }
        return count
    }
    
    func getNoBrokenTackleCount() -> Int {
        var count = 0
        for result in self.hadBrokenTackleHistory {
            if result == "NO" {
                count += 1
            }
        }
        return count
    }
    
    func getTotalViolentFinishCount() -> Int {
        return self.getYesViolentFinishCount() + self.getNoViolentFinishCount()
    }
    
    func getYesViolentFinishCount() -> Int {
        var count = 0
        for result in self.hadViolentFinishHistory {
            if result == "YES" {
                count += 1
            }
        }
        return count
    }
    
    func getNoViolentFinishCount() -> Int {
        var count = 0
        for result in self.hadViolentFinishHistory {
            if result == "NO" {
                count += 1
            }
        }
        return count
    }
    
    func getTotalCutbackCount() -> Int {
        return self.getYesCutbackCount() + self.getNoCutbackCount()
    }
    
    func getYesCutbackCount() -> Int {
        var count = 0
        for result in self.hadCutbackHistory {
            if result == "YES" {
                count += 1
            }
        }
        return count
    }
    
    func getNoCutbackCount() -> Int {
        var count = 0
        for result in self.hadCutbackHistory {
            if result == "NO" {
                count += 1
            }
        }
        return count
    }
    
    func getTotalNumberOfYardsRanCarries() -> Int {
        var countCarries = 0
        for yardResult in yardsRan {
            if yardResult != "/" {
                countCarries += 1
            }
        }
        return countCarries
    }
    
    func getTotalNumberOfYardsRan() -> Int {
        var intYardsRan = [Int]()
        var totalYards = 0
        for yardResult in yardsRan {
            if yardResult != "/" {
                let intYardResult = Int(yardResult)
                totalYards += intYardResult!
            }
        }
        return totalYards
    }
    
    func getAverageYardsRanPerCarry() -> Double {
        var countCarries = 0
        var intYardsRan = [Int]()
        var totalYards = 0
        if yardsRan.count == 0 { return 0.0}
        for yardResult in yardsRan {
            if yardResult != "/" {
                let intYardResult = Int(yardResult)
                totalYards += intYardResult!
                intYardsRan.append(intYardResult!)
                countCarries += 1
            }
        }
        let result = Double(totalYards) / Double(yardsRan.count)
        return Double(round(100*result) / 100) // round to 2 decimal places
    }
    
    func getTotalNumberOfYardsAfterContactCarries() -> Int {
        var countCarries = 0
        for yardResult in yardsAfterContact {
            if yardResult != "N/A" {
                countCarries += 1
            }
        }
        return countCarries
    }
    
    func getTotalNumberOfYardsAfterContact() -> Int {
        var intYardsRan = [Int]()
        var totalYards = 0
        for yardResult in yardsAfterContact {
            if yardResult != "/" {
                let intYardResult = Int(yardResult)
                totalYards += intYardResult!
            }
        }
        return totalYards
    }
    
    
    func getAverageYardsAfterContactPerContactCarry() -> Double {
        if yardsAfterContact.count == 0 { return 0.0}
        var countCarries = 0
        var intYardsAfterContactRan = [Int]()
        var totalYards = 0
        for yardResult in yardsAfterContact {
            if yardResult != "/" {
                let intYardResult = Int(yardResult)
                totalYards += intYardResult!
                intYardsAfterContactRan.append(intYardResult!)
                countCarries += 1
            }
        }
        let result = Double(totalYards) / Double(yardsAfterContact.count)
        return Double(round(100 * result) / 100) // round to 2 decimal places
    }
    
}

















