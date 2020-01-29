//
//  PlayResult.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 11/9/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

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

struct PlayResultKeys {
    
    static let runningBackName = "name"
    static let runningBackNumber = "number"
    static let playCount = "playCount"
    static let yardsRan = "yardsRan"
    static let yardsAfterContact = "yardsAfterContact"
    static let hadBrokenTackle = "hadBrokenTackle"
    static let hadPassProtection = "hadPassProtection"
    static let hadViolentFinish = "hadViolentFinish"
    static let hadCutback = "hadCutback"
    static let playRating = "playRating"
    static let comment = "comment"
}

class PlayResult: NSObject, NSCoding {
    
    private var _runningBackName: String!
    private var _runningBackNumber: String!
    
    private var _playCount: String!
    
    private var _yardsRan: String!
    private var _yardsAfterContact: String!
    
    private var _playRating: Int!
    
    private var _comment: String!
    
    // The following var's need -1 for Fail, 0 for N/A, +1 for Success
    private var _hadBrokenTackle: String!
    private var _hadPassProtection: String!
    private var _hadViolentFinish: String!
    private var _hadCutback: String!
    // Need 3-D array for each
    // Outmost array for category
    // middle array for play #
    // Innermost array for result (N/A for not applicable,
    
    override init() {}
    
    required init?(coder aDecoder: NSCoder) {
        if let nameObj = aDecoder.decodeObject(forKey: PlayResultKeys.runningBackName) as? String {
            _runningBackName = nameObj
        }
        if let numberObj = aDecoder.decodeObject(forKey: PlayResultKeys.runningBackNumber) as? String {
            _runningBackNumber = numberObj
        }
        
        if let playCountObj = aDecoder.decodeObject(forKey: PlayResultKeys.playCount) as? String {
            _playCount = playCountObj
        }
        
        if let yardsRanObj = aDecoder.decodeObject(forKey: PlayResultKeys.yardsRan) as? String {
            _yardsRan = yardsRanObj
        }
        
        if let yardsAfterContactObj = aDecoder.decodeObject(forKey: PlayResultKeys.yardsAfterContact) as? String {
            _yardsAfterContact = yardsAfterContactObj
        }
        if let hadBrokenTackleObj = aDecoder.decodeObject(forKey: PlayResultKeys.hadBrokenTackle) as? String {
            _hadBrokenTackle = hadBrokenTackleObj
        }
        if let hadCutbackObj = aDecoder.decodeObject(forKey: PlayResultKeys.hadCutback) as? String {
            _hadCutback = hadCutbackObj
        }
        if let hadPassProtectionObj = aDecoder.decodeObject(forKey: PlayResultKeys.hadPassProtection) as? String {
            _hadPassProtection = hadPassProtectionObj
        }
        if let hadViolentFinishObj = aDecoder.decodeObject(forKey: PlayResultKeys.hadViolentFinish) as? String {
            _hadViolentFinish = hadViolentFinishObj
        }
        if let playRatingObj = aDecoder.decodeObject(forKey: PlayResultKeys.playRating) as? Int {
            _playRating = playRatingObj
        }
        if let commentObj = aDecoder.decodeObject(forKey: PlayResultKeys.comment ) as? String {
            _comment = commentObj
        }
    }
    
    init(newName: String,
         newNumber: String,
         newPlayCount: String,
         newYardsRan: String,
         newYardsAfterContact: String,
         newHadBrokenTackle: String,
         newHadCutback: String,
         newHadPassProtection: String,
         newHadViolentFinish: String,
         newPlayRating: Int,
         newComment: String) {
        super.init()
        self._runningBackName = newName
        self._runningBackNumber = newNumber
        self._playCount = newPlayCount
        self._yardsRan = newYardsRan
        self._yardsAfterContact = newYardsAfterContact
        self._hadCutback = newHadCutback
        self._hadBrokenTackle = newHadBrokenTackle
        self._hadViolentFinish = newHadViolentFinish
        self._hadPassProtection = newHadPassProtection
        self._playRating = newPlayRating
        self._comment = newComment
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(_runningBackName, forKey: PlayResultKeys.runningBackName)
        aCoder.encode(_runningBackNumber, forKey: PlayResultKeys.runningBackNumber)
        aCoder.encode(_yardsRan, forKey: PlayResultKeys.yardsRan)
        aCoder.encode(_playCount, forKey: PlayResultKeys.playCount)
        aCoder.encode(_yardsAfterContact, forKey: PlayResultKeys.yardsAfterContact)
        aCoder.encode(_hadBrokenTackle, forKey: PlayResultKeys.hadBrokenTackle)
        aCoder.encode(_hadCutback, forKey: PlayResultKeys.hadCutback)
        aCoder.encode(_hadPassProtection, forKey: PlayResultKeys.hadPassProtection)
        aCoder.encode(_hadViolentFinish, forKey: PlayResultKeys.hadViolentFinish)
        aCoder.encode(_playRating, forKey: PlayResultKeys.playRating)
        aCoder.encode(_comment, forKey: PlayResultKeys.comment)
    }
    
    var runningBackName: String {
        get {return _runningBackName}
        set {_runningBackName = newValue}
    }
    
    var runningBackNumber: String {
        get {return _runningBackNumber}
        set { _runningBackNumber = newValue}
    }
    
    var yardsRan: String {
        get {return _yardsRan}
        set { _yardsRan = newValue}
    }
    
    var yardsAfterContact: String {
        get {return _yardsAfterContact}
        set { _yardsAfterContact = newValue}
    }
    
    var playCount: String {
        get {return _playCount}
        set {_playCount = newValue}
    }
    
    var hadBrokenTackle: String {
        get {return _hadBrokenTackle}
        set { _hadBrokenTackle = newValue}
    }
    
    var hadCutback: String {
        get {return _hadCutback}
        set { _hadCutback = newValue}
    }
    
    var hadPassProtection: String {
        get {return _hadPassProtection}
        set { _hadPassProtection = newValue}
    }
    
    var hadViolentFinish: String {
        get {return _hadViolentFinish}
        set { _hadViolentFinish = newValue}
    }
    
    var playRating: Int {
        get {return _playRating}
        set {_playRating = newValue}
    }
    
    var comment: String {
        get {return _comment}
        set {_comment = newValue}
    }
    
    
}


















