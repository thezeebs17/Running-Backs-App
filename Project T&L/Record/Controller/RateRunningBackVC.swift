//
//  ViewController.swift
//  Project T&L
//
//  Created by Zeebo Gouldon on 9/15/18.
//  Copyright © 2018 Zeebo Gouldon. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit




class RateRunningBackViewController: UIViewController, UITextViewDelegate {

    var runningBackIndex = Int()
    var categoryIndex = Int()
    
    var catRunningBacks = [[RunningBack]]()
    var playResults = [[PlayResult]]()
    var undoHistory = [[PlayResult]]()
    
    var playIndex = Int()
    
    
    var runningBackName = String()
    var runningBackNumber = String()
    
    var substituteTitle = String()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let yardsRanTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Yds Ran"
        textField.keyboardType = .numbersAndPunctuation
        textField.textAlignment = .center
        textField.backgroundColor = .yellow
        return textField
    }()
    
    let yardsAfterContactTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Yds after contact"
        textField.keyboardType = .numbersAndPunctuation
        textField.textAlignment = .center
        textField.backgroundColor = .yellow
        return textField
    }()
    
    let passProtectionTechniqueLabel: UILabel = {
        return getGrayUILabel(text: "Pass Protection Technique?")
    }()
    
    let brokenTackleLabel: UILabel = {
        return getGrayUILabel(text: "Broken Tackle?")
    }()
    
    let tooManyCutbacksLabel: UILabel = {
        return getGrayUILabel(text: "Too Many Cutbacks?")
    }()
    
    let violentFinishLabel: UILabel = {
        return getGrayUILabel(text: "Violent Finish?")
    }()
    
    let hadPassProtectionTechniqueSegmentControl: UISegmentedControl = {
        return threeWayBoolSegmentControlDefault()
    }()
    
    let hadBrokenTackleSegmentControl: UISegmentedControl = {
        return threeWayBoolSegmentControlDefault()
    }()
    
    let hadTooManyCutbacksSegmentControl: UISegmentedControl = {
        return threeWayBoolSegmentControlDefault()
    }()
    
    let hadViolentFinishSegmentControl: UISegmentedControl = {
        return threeWayBoolSegmentControlDefault()
    }()
    
    let playRatingSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl()
        segmentControl.insertSegment(withTitle: "2", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "1", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "0", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "-1", at: 0, animated: true)
        segmentControl.selectedSegmentIndex = 2
        return segmentControl
    }()
    
    let snapButton: UIButton = {
        let button = UIButton(type: .system)
        //        button.titleLabel?.text = "SNAP!"
        button.setTitle("SNAP!", for: .normal)
        button.tintColor = .white // think "title color" (but it tech'ly isn't)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(snapPressed), for: .touchUpInside)
        return button
    }()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        //        button.titleLabel?.text = "SNAP!"
        button.setTitle("UNDO", for: .normal)
        button.tintColor = .white // think "title color" (but it tech'ly isn't)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.addTarget(self, action: #selector(undoPressed), for: .touchUpInside)
        return button
    }()
    
    let redoButton: UIButton = {
        let button = UIButton(type: .system)
        //        button.titleLabel?.text = "SNAP!"
        button.setTitle("REDO", for: .normal)
        button.tintColor = .white // think "title color" (but it tech'ly isn't)
        button.backgroundColor = UIColor(r: 10, g: 220, b: 10)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.addTarget(self, action: #selector(redoPressed), for: .touchUpInside)
        return button
    }()
    
    let snapCountLabel: UILabel = {
        let label = getGrayUILabel(text: "##")
        label.textAlignment = .center
        return label
    }()
    
    let snapCountPlayerLabel: UILabel = {
        let label = getGrayUILabel(text: "##")
        label.backgroundColor = .magenta
        return label
    }()
    
    let commentsTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(r: 240, g: 240, b: 240)
        textView.text = "Comments"
        textView.textColor = .lightGray
        textView.font = UIFont(name: textView.font?.fontName as! String, size: 14)
        return textView
    }()
    
    @objc func snapPressed(sender: UIButton) {
        // need to make sure that enable/disable snap button
        // and stuff are working fine.
        undoHistory[categoryIndex] = [PlayResult]()
        var newHadViolentFinish = hadViolentFinishSegmentControl.titleForSegment(at: hadViolentFinishSegmentControl.selectedSegmentIndex)!
        var newHadPassProtection = hadPassProtectionTechniqueSegmentControl.titleForSegment(at: hadPassProtectionTechniqueSegmentControl.selectedSegmentIndex)!
        var newHadBrokenTackle = hadBrokenTackleSegmentControl.titleForSegment(at: hadBrokenTackleSegmentControl.selectedSegmentIndex)!
        var newHadTooManyCutbacks = hadTooManyCutbacksSegmentControl.titleForSegment(at: hadTooManyCutbacksSegmentControl.selectedSegmentIndex)!
        var newYardsRan = "/"
        var newYardsAfterContact = "/"
        var newComment = ""
        if commentsTextView.text != "Comments" {
            newComment = commentsTextView.text
        }
        let newPlayRating = Int(playRatingSegmentControl.titleForSegment(at: playRatingSegmentControl.selectedSegmentIndex)!)
        if yardsRanTextField.hasText {
            newYardsRan = yardsRanTextField.text!
        }
        if yardsAfterContactTextField.hasText {
            newYardsAfterContact = yardsAfterContactTextField.text!
        }
        var newResult = PlayResult(newName: runningBackName,
                                   newNumber: runningBackNumber,
                                   newPlayCount: "\(playResults[categoryIndex].count+1)",
                                   newYardsRan: newYardsRan,
                                   newYardsAfterContact: newYardsAfterContact,
                                   newHadBrokenTackle: newHadBrokenTackle,
                                   newHadCutback: newHadTooManyCutbacks,
                                   newHadPassProtection: newHadPassProtection,
                                   newHadViolentFinish: newHadViolentFinish,
                                   newPlayRating: newPlayRating!,
                                   newComment: newComment)
        playResults[categoryIndex].append(newResult)
        
        catRunningBacks[categoryIndex][runningBackIndex].snapCount += 1
        catRunningBacks[categoryIndex][runningBackIndex].yardsRan.append(newYardsRan)
        catRunningBacks[categoryIndex][runningBackIndex].yardsAfterContact.append(newYardsAfterContact)
        catRunningBacks[categoryIndex][runningBackIndex].playRatings.append(newPlayRating!)
        if hadBrokenTackleSegmentControl.selectedSegmentIndex == 2 {
            catRunningBacks[categoryIndex][runningBackIndex].hadBrokenTackleCount += 1
            
        }
        if hadTooManyCutbacksSegmentControl.selectedSegmentIndex == 2 {
            catRunningBacks[categoryIndex][runningBackIndex].hadCutbackCount += 1
        }
        if hadPassProtectionTechniqueSegmentControl.selectedSegmentIndex == 2 {
            catRunningBacks[categoryIndex][runningBackIndex].hadPassProtectionCount += 1
        }
        if hadViolentFinishSegmentControl.selectedSegmentIndex == 2 {
            catRunningBacks[categoryIndex][runningBackIndex].hadViolentFinishCount += 1
        }
        catRunningBacks[categoryIndex][runningBackIndex].hadBrokenTackleHistory.append(hadBrokenTackleSegmentControl.titleForSegment(at: hadBrokenTackleSegmentControl.selectedSegmentIndex)!)
        catRunningBacks[categoryIndex][runningBackIndex].hadCutbackHistory.append(hadTooManyCutbacksSegmentControl.titleForSegment(at: hadTooManyCutbacksSegmentControl.selectedSegmentIndex)!)
        catRunningBacks[categoryIndex][runningBackIndex].hadPassProtectionHistory.append(hadPassProtectionTechniqueSegmentControl.titleForSegment(at: hadPassProtectionTechniqueSegmentControl.selectedSegmentIndex)!)
        catRunningBacks[categoryIndex][runningBackIndex].hadViolentFinishHistory.append(hadViolentFinishSegmentControl.titleForSegment(at: hadViolentFinishSegmentControl.selectedSegmentIndex)!)
        
    
        let defaults = UserDefaults.standard
        let savePlayResults = NSKeyedArchiver.archivedData(withRootObject: playResults)
        let saveCatRunningBacks = NSKeyedArchiver.archivedData(withRootObject: catRunningBacks)
        let saveUndoHistory = NSKeyedArchiver.archivedData(withRootObject: undoHistory)
        defaults.set(saveUndoHistory, forKey: "undoHistory")
        defaults.set(saveCatRunningBacks, forKey: "catRunningBacks")
        defaults.set(savePlayResults, forKey: "playResults")
        resetUIFeatures()
        updateSnapLabels()
        hideOrShowUndoButton(hide: false)
        //self.navigationController?.popViewController(animated: true)
    }
    
    func hideOrShowRedoButton(hide: Bool) {
        if hide {
            redoButton.isHidden = true
        } else {
            redoButton.isHidden = false
        }
    }
    
    func hideOrShowUndoButton(hide: Bool) {
        if hide {
            undoButton.isHidden = true
        } else {
            undoButton.isHidden = false
        }
    }
    
    @objc func undoPressed(sender: UIButton) {
        
        // pop off the most recently saved playResult from playResults core data
        // array, and store it in undoHistory.
        // Also, be sure to go to the appropriate runningBack in catRunningBacks
        // and "untally" the appropriate categories and yards ran, etc.
        if !(playResults[categoryIndex].isEmpty) {
            let undoPlayResult = playResults[categoryIndex][playResults[categoryIndex].count-1]
            var undoIndex = 0
            if undoPlayResult.runningBackNumber == "26" {
                // Biaggio Ali Walsh undo
                // undoIndex == 0
                undoIndex = 0
            } else if undoPlayResult.runningBackNumber == "28" {
                // Patrick Laird undo
                // undoIndex == 1
                undoIndex = 1
            } else if undoPlayResult.runningBackNumber == "29" {
                // Marcel Dancy undo
                // undoIndex == 2
                undoIndex = 2
            } else if undoPlayResult.runningBackNumber == "31" {
                // Alex Netherda undo
                // undoIndex == 3
                undoIndex = 3
            } else if undoPlayResult.runningBackNumber == "33" {
                // Derrick Clark undo
                // undoIndex == 4
                undoIndex = 4
            } else if undoPlayResult.runningBackNumber == "34" {
                // Christopher Brown Jr. undo
                // undoIndex == 5
                undoIndex = 5
            }
            if undoPlayResult.hadCutback == "YES" {
                catRunningBacks[categoryIndex][undoIndex].hadCutbackCount -= 1
            }
            
            if undoPlayResult.hadBrokenTackle == "YES" {
                catRunningBacks[categoryIndex][undoIndex].hadBrokenTackleCount -= 1
            }
            
            if undoPlayResult.hadViolentFinish == "YES" {
                catRunningBacks[categoryIndex][undoIndex].hadViolentFinishCount -= 1
            }
            
            if undoPlayResult.hadPassProtection == "YES" {
                catRunningBacks[categoryIndex][undoIndex].hadPassProtectionCount -= 1
            }
            
            if undoPlayResult.yardsRan != "/" {
                catRunningBacks[categoryIndex][undoIndex].yardsRan.remove(at: catRunningBacks[categoryIndex][undoIndex].yardsRan.count-1)
            }
            
            if undoPlayResult.yardsAfterContact != "/" {
                catRunningBacks[categoryIndex][undoIndex].yardsAfterContact.remove(at: catRunningBacks[categoryIndex][undoIndex].yardsAfterContact.count-1)
            }
            
            catRunningBacks[categoryIndex][undoIndex].playRatings.remove(at: catRunningBacks[categoryIndex][undoIndex].playRatings.count-1)
            
            catRunningBacks[categoryIndex][undoIndex].hadCutbackHistory.remove(at: catRunningBacks[categoryIndex][undoIndex].hadCutbackHistory.count-1)
            catRunningBacks[categoryIndex][undoIndex].hadBrokenTackleHistory.remove(at: catRunningBacks[categoryIndex][undoIndex].hadBrokenTackleHistory.count-1)
            catRunningBacks[categoryIndex][undoIndex].hadViolentFinishHistory.remove(at: catRunningBacks[categoryIndex][undoIndex].hadViolentFinishHistory.count-1)
            catRunningBacks[categoryIndex][undoIndex].hadPassProtectionHistory.remove(at: catRunningBacks[categoryIndex][undoIndex].hadPassProtectionHistory.count-1)
            catRunningBacks[categoryIndex][undoIndex].snapCount -= 1
            undoHistory[categoryIndex].append(undoPlayResult)
            playResults[categoryIndex].remove(at: playResults[categoryIndex].count-1)
            let defaults = UserDefaults.standard
            let saveCatRunningBacks = NSKeyedArchiver.archivedData(withRootObject: catRunningBacks)
            let saveUndoHistory = NSKeyedArchiver.archivedData(withRootObject: undoHistory)
            let savePlayResults = NSKeyedArchiver.archivedData(withRootObject: playResults)
            defaults.set(saveCatRunningBacks, forKey: "catRunningBacks")
            defaults.set(saveUndoHistory, forKey: "undoHistory")
            defaults.set(savePlayResults, forKey: "playResults")
            updateSnapLabels()
            hideOrShowRedoButton(hide: false)
        }
        
    }
    
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        
//        //textField.resignFirstResponder()
//        //or
//        self.view.endEditing(true)
//        return true
//    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if commentsTextView.textColor == UIColor.lightGray {
            commentsTextView.text = nil
            commentsTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if commentsTextView.text.isEmpty {
            commentsTextView.text = "Comments"
            commentsTextView.textColor = UIColor.lightGray
        }
    }
    
    @objc func redoPressed(sender: UIButton) {
        // From undoHistory, find the recently used running back
        // and re-add in whatever results were made into the count for
        // that running back
        // and also add back in this playResult from undoHistory into
        // the playResults core data array.
        if !(undoHistory[categoryIndex].isEmpty) {
            let redoPlayResult = undoHistory[categoryIndex][undoHistory[categoryIndex].count-1]
            
            var redoIndex = 0
            if redoPlayResult.runningBackNumber == "26" {
                // Biaggio Ali Walsh redo
                // redoIndex == 0
                redoIndex = 0
            } else if redoPlayResult.runningBackNumber == "28" {
                // Patrick Laird redo
                // redoIndex == 1
                redoIndex = 1
            } else if redoPlayResult.runningBackNumber == "29" {
                // Marcel Dancy redo
                // redoIndex == 2
                redoIndex = 2
            } else if redoPlayResult.runningBackNumber == "31" {
                // Alex Netherda redo
                // redoIndex == 3
                redoIndex = 3
            } else if redoPlayResult.runningBackNumber == "33" {
                // Derrick Clark redo
                // redoIndex == 4
                redoIndex = 4
            } else if redoPlayResult.runningBackNumber == "34" {
                // Christopher Brown Jr. redo
                // redoIndex == 5
                redoIndex = 5
            }
            if redoPlayResult.hadCutback == "YES" {
                catRunningBacks[categoryIndex][redoIndex].hadCutbackCount += 1
            }
            if redoPlayResult.hadBrokenTackle == "YES" {
                catRunningBacks[categoryIndex][redoIndex].hadBrokenTackleCount += 1
            }
            if redoPlayResult.hadViolentFinish == "YES" {
                catRunningBacks[categoryIndex][redoIndex].hadViolentFinishCount += 1
            }
            if redoPlayResult.hadPassProtection == "YES" {
                catRunningBacks[categoryIndex][redoIndex].hadPassProtectionCount += 1
            }
            if redoPlayResult.yardsRan != "/" {
                catRunningBacks[categoryIndex][redoIndex].yardsRan.append(redoPlayResult.yardsRan)
            }
            if redoPlayResult.yardsAfterContact != "/" {
                catRunningBacks[categoryIndex][redoIndex].yardsAfterContact.append(redoPlayResult.yardsAfterContact)
            }
            catRunningBacks[categoryIndex][redoIndex].playRatings.append(redoPlayResult.playRating)
            catRunningBacks[categoryIndex][redoIndex].hadCutbackHistory.append(redoPlayResult.hadCutback)
            catRunningBacks[categoryIndex][redoIndex].hadPassProtectionHistory.append(redoPlayResult.hadPassProtection)
            catRunningBacks[categoryIndex][redoIndex].hadBrokenTackleHistory.append(redoPlayResult.hadBrokenTackle)
            catRunningBacks[categoryIndex][redoIndex].hadViolentFinishHistory.append(redoPlayResult.hadViolentFinish)
            catRunningBacks[categoryIndex][redoIndex].snapCount += 1
            playResults[categoryIndex].append(redoPlayResult)
            undoHistory[categoryIndex].remove(at: undoHistory[categoryIndex].count-1)
            let defaults = UserDefaults.standard
            let saveCatRunningBacks = NSKeyedArchiver.archivedData(withRootObject: catRunningBacks)
            let saveUndoHistory = NSKeyedArchiver.archivedData(withRootObject: undoHistory)
            let savePlayResults = NSKeyedArchiver.archivedData(withRootObject: playResults)
            defaults.set(saveCatRunningBacks, forKey: "catRunningBacks")
            defaults.set(saveUndoHistory, forKey: "undoHistory")
            defaults.set(savePlayResults, forKey: "playResults")
            updateSnapLabels()
            hideOrShowRedoButton(hide: false)
        }
        updateSnapLabels()
    }
    
    @objc func endEditing(sender: Any) {
        (sender as AnyObject).endEditing(true)
    }
    
    private func resetUIFeatures() {
//        self.view.endEditing(true)
        hadPassProtectionTechniqueSegmentControl.selectedSegmentIndex = 0
        hadTooManyCutbacksSegmentControl.selectedSegmentIndex = 0
        hadBrokenTackleSegmentControl.selectedSegmentIndex = 0
        hadViolentFinishSegmentControl.selectedSegmentIndex = 0
        playRatingSegmentControl.selectedSegmentIndex = 2
        yardsRanTextField.text = ""
        yardsAfterContactTextField.text = ""
        commentsTextView.text = "Comments"
        commentsTextView.textColor = .lightGray
    }
    
    private func updateSnapLabels() {
        snapCountLabel.text = "\(playResults[categoryIndex].count)"
        if undoHistory[categoryIndex].count != 0 {
            hideOrShowRedoButton(hide: false)
        } else {
            hideOrShowRedoButton(hide: true)
        }
        if playResults[categoryIndex].count != 0 {
            hideOrShowUndoButton(hide: false)
        } else {
            hideOrShowUndoButton(hide: true)
        }
    }
    
    private func saveYardsRan() {
        
//        if catRunningBacks[categoryIndex][runningBackIndex].yardsRan[categoryIndex].count == 0 {
//            catRunningBacks[categoryIndex][runningBackIndex].yardsRan[categoryIndex].append([Int]())
//
//        }
        //catRunningBacks[categoryIndex][runningBackIndex].yardsRan[categoryIndex][playIndex].append(Int(yardsRanTextField.text!))
    }
    
    // MARK: View Stuff
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        loadCoreData()
        //setUpNavItems()
        self.navigationItem.title = substituteTitle
        commentsTextView.delegate = self
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        //self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing)))
        setUpViews()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
//        scrollView.delegate = self as! UIScrollViewDelegate
        updateSnapLabels()
        
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func setUpNavItems() {
        /*
         UIView *buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
         buttonContainer.backgroundColor = [UIColor clearColor];
         UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
         [button0 setFrame:CGRectMake(0, 0, 44, 44)];
         [button0 setBackgroundImage:[UIImage imageNamed:@"button0.png"] forState:UIControlStateNormal];
         [button0 addTarget:self action:@selector(button0Action:) forControlEvents:UIControlEventTouchUpInside];
         [button0 setShowsTouchWhenHighlighted:YES];
         [buttonContainer addSubview:button0];
         */
        var substituteButton = UIButton(type: .system)
        substituteButton.setTitle(substituteTitle, for: .normal)
        //substituteButton.addTarget(self, action: #selector(substitutePressed), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: substituteButton)
    }
    
    @objc func substitutePressed(sender: Any?) {
        let substutionController = SelectRunningBackDatasourceController()
        substutionController.categoryIndex = self.categoryIndex
        self.navigationController?.present(substutionController, animated: true, completion: nil)
    }
    
    func loadCoreData() {
        let defaults = UserDefaults.standard
        if let savedCatRunningBacks = defaults.object(forKey: "catRunningBacks") as? Data {
            catRunningBacks = NSKeyedUnarchiver.unarchiveObject(with: savedCatRunningBacks) as! [[RunningBack]]
        }
        if let savedPlayResults = defaults.object(forKey: "playResults") as? Data {
            playResults = NSKeyedUnarchiver.unarchiveObject(with: savedPlayResults) as! [[PlayResult]]
        }
        if let savedUndoHistory = defaults.object(forKey: "undoHistory") as? Data {
            undoHistory = NSKeyedUnarchiver.unarchiveObject(with: savedUndoHistory) as! [[PlayResult]]
        }
        //playIndex = catRunningBacks[categoryIndex][runningBackIndex].yardsRan.count - 1
    }

    // MARK: View Constraints
    
    var passProtectionLabelTopConst: CGFloat = 2
    var labelHeight: CGFloat = 20
    var textFieldWidth: CGFloat = 180
    var textFieldHeight: CGFloat = 40
    var segmentControlWidth: CGFloat = 220
    var segmentControlHeight: CGFloat = 30
    var viewsGapTopConst: CGFloat = 8
    var segmentControlLabelsTopConst: CGFloat = 5
    var snapButtonTopConst: CGFloat = 12
    var labelSegmentGapTopConst: CGFloat = 0
    
    var yardsTextFieldHorizontalGapConst: CGFloat = 5
    var snapCountLabelWidth: CGFloat = 20
    var snapCountLabelHeight: CGFloat = 15
    
    var snapButtonWidthConst: CGFloat = 84
    var snapButtonHeightConst: CGFloat = 45
    
    var commentsTextFieldWidth: CGFloat = 300
    var commentsTextFieldHeight: CGFloat = 100
    
    var undoRedoGapConst: CGFloat = 14
    
    func setUpViews() {
        view.addSubview(scrollView)
        scrollView.anchor(view.topAnchor,
                          left: view.leftAnchor,
                          bottom: view.bottomAnchor,
                          right: view.rightAnchor,
                          topConstant: 0,
                          leftConstant: 0,
                          bottomConstant: 0,
                          rightConstant: 0,
                          widthConstant: view.frame.width,
                          heightConstant: view.frame.height)
        
        scrollView.addSubview(passProtectionTechniqueLabel)
        passProtectionTechniqueLabel.anchor(scrollView.topAnchor,
                                            left: scrollView.centerXAnchor,
                                            bottom: nil,
                                            right: nil,
                                            topConstant: passProtectionLabelTopConst,
                                            leftConstant: segmentControlWidth * -1 / 2,
                                            bottomConstant: 0,
                                            rightConstant: 0,
                                            widthConstant: segmentControlWidth,
                                            heightConstant: labelHeight)
        scrollView.addSubview(hadPassProtectionTechniqueSegmentControl)
        hadPassProtectionTechniqueSegmentControl.anchor(passProtectionTechniqueLabel.bottomAnchor,
                                                        left: scrollView.centerXAnchor,
                                                        bottom: nil,
                                                        right: nil,
                                                        topConstant: labelSegmentGapTopConst,
                                                        leftConstant: segmentControlWidth * -1 / 2,
                                                        bottomConstant: 0,
                                                        rightConstant: 0,
                                                        widthConstant: segmentControlWidth,
                                                        heightConstant: segmentControlHeight)
        scrollView.addSubview(tooManyCutbacksLabel)
        tooManyCutbacksLabel.anchor(hadPassProtectionTechniqueSegmentControl.bottomAnchor,
                                    left: scrollView.centerXAnchor,
                                    bottom: nil,
                                    right: nil,
                                    topConstant: segmentControlLabelsTopConst,
                                    leftConstant: segmentControlWidth * -1 / 2,
                                    bottomConstant: 0,
                                    rightConstant: 0,
                                    widthConstant: segmentControlWidth,
                                    heightConstant: labelHeight)
        scrollView.addSubview(hadTooManyCutbacksSegmentControl)
        hadTooManyCutbacksSegmentControl.anchor(tooManyCutbacksLabel.bottomAnchor,
                                                left: scrollView.centerXAnchor,
                                                bottom: nil,
                                                right: nil,
                                                topConstant: labelSegmentGapTopConst,
                                                leftConstant: segmentControlWidth * -1 / 2,
                                                bottomConstant: 0,
                                                rightConstant: 0,
                                                widthConstant: segmentControlWidth,
                                                heightConstant: segmentControlHeight)
        
        scrollView.addSubview(brokenTackleLabel)
        brokenTackleLabel.anchor(hadTooManyCutbacksSegmentControl.bottomAnchor,
                                 left: scrollView.centerXAnchor,
                                 bottom: nil,
                                 right: nil,
                                 topConstant: segmentControlLabelsTopConst,
                                 leftConstant: segmentControlWidth * -1 / 2,
                                 bottomConstant: 0,
                                 rightConstant: 0,
                                 widthConstant: segmentControlWidth,
                                 heightConstant: labelHeight)
        scrollView.addSubview(hadBrokenTackleSegmentControl)
        hadBrokenTackleSegmentControl.anchor(brokenTackleLabel.bottomAnchor,
                                             left: scrollView.centerXAnchor,
                                             bottom: nil,
                                             right: nil,
                                             topConstant: labelSegmentGapTopConst,
                                             leftConstant: segmentControlWidth * -1 / 2,
                                             bottomConstant: 0,
                                             rightConstant: 0,
                                             widthConstant: segmentControlWidth,
                                             heightConstant: segmentControlHeight)
        
        scrollView.addSubview(violentFinishLabel)
        violentFinishLabel.anchor(hadBrokenTackleSegmentControl.bottomAnchor,
                                  left: scrollView.centerXAnchor,
                                  bottom: nil,
                                  right: nil,
                                  topConstant: segmentControlLabelsTopConst,
                                  leftConstant: segmentControlWidth * -1 / 2,
                                  bottomConstant: 0,
                                  rightConstant: 0,
                                  widthConstant: segmentControlWidth,
                                  heightConstant: labelHeight)
        scrollView.addSubview(hadViolentFinishSegmentControl)
        hadViolentFinishSegmentControl.anchor(violentFinishLabel.bottomAnchor,
                                              left: scrollView.centerXAnchor,
                                              bottom: nil,
                                              right: nil,
                                              topConstant: labelSegmentGapTopConst,
                                              leftConstant: segmentControlWidth * -1 / 2,
                                              bottomConstant: 0,
                                              rightConstant: 0,
                                              widthConstant: segmentControlWidth,
                                              heightConstant: segmentControlHeight)
        scrollView.addSubview(playRatingSegmentControl)
        playRatingSegmentControl.anchor(hadViolentFinishSegmentControl.bottomAnchor,
                                 left: scrollView.centerXAnchor,
                                 bottom: nil,
                                 right: nil,
                                 topConstant: viewsGapTopConst + 4,
                                 leftConstant: commentsTextFieldWidth * -1 / 2,
                                 bottomConstant: 0,
                                 rightConstant: 0,
                                 widthConstant: commentsTextFieldWidth,
                                 heightConstant: segmentControlHeight)
        
        scrollView.addSubview(yardsRanTextField)
        yardsRanTextField.anchor(playRatingSegmentControl.bottomAnchor,
                                 left: nil,
                                 bottom: nil,
                                 right: scrollView.centerXAnchor,
                                 topConstant: viewsGapTopConst + 4,
                                 leftConstant: 0,
                                 bottomConstant: 0,
                                 rightConstant: yardsTextFieldHorizontalGapConst,
                                 widthConstant: textFieldWidth,
                                 heightConstant: textFieldHeight)
        scrollView.addSubview(yardsAfterContactTextField)
        yardsAfterContactTextField.anchor(playRatingSegmentControl.bottomAnchor,
                                          left: scrollView.centerXAnchor,
                                          bottom: nil,
                                          right: nil,
                                          topConstant: viewsGapTopConst + 4,
                                          leftConstant: yardsTextFieldHorizontalGapConst,
                                          bottomConstant: 0,
                                          rightConstant: 0,
                                          widthConstant: textFieldWidth,
                                          heightConstant: textFieldHeight)
        
        scrollView.addSubview(snapButton)
        snapButton.anchor(yardsAfterContactTextField.bottomAnchor,
                          left: scrollView.centerXAnchor,
                          bottom: nil,
                          right: nil,
                          topConstant: snapButtonTopConst,
                          leftConstant: snapButtonWidthConst * -1 / 2,
                          bottomConstant: 0,
                          rightConstant: 0,
                          widthConstant: snapButtonWidthConst,
                          heightConstant: snapButtonHeightConst)
        
        scrollView.addSubview(snapCountLabel)
        snapCountLabel.anchor(snapButton.bottomAnchor,
                              left: scrollView.centerXAnchor,
                              bottom: nil,
                              right: nil,
                              topConstant: 3,
                              leftConstant: 20 * -1 / 2,
                              bottomConstant: 0,
                              rightConstant: 0,
                              widthConstant: 20,
                              heightConstant: 15)
        scrollView.addSubview(undoButton)
        undoButton.anchor(snapButton.topAnchor,
                          left: nil,
                          bottom: nil,
                          right: snapButton.leftAnchor,
                          topConstant: 0,
                          leftConstant: 0,
                          bottomConstant: 0,
                          rightConstant: undoRedoGapConst,
                          widthConstant: snapButtonWidthConst - 16,
                          heightConstant: snapButtonHeightConst - 10)
        
        view.addSubview(redoButton)
        redoButton.anchor(snapButton.topAnchor,
                          left: snapButton.rightAnchor,
                          bottom: nil,
                          right: nil,
                          topConstant: 0,
                          leftConstant: undoRedoGapConst,
                          bottomConstant: 0,
                          rightConstant: 0,
                          widthConstant: snapButtonWidthConst - 16,
                          heightConstant: snapButtonHeightConst - 10)
        
        scrollView.addSubview(commentsTextView)
        commentsTextView.anchor(snapCountLabel.bottomAnchor,
                                 left: scrollView.centerXAnchor,
                                 bottom: nil,
                                 right: nil,
                                 topConstant: viewsGapTopConst,
                                 leftConstant: commentsTextFieldWidth * -1 / 2,
                                 bottomConstant: 0,
                                 rightConstant: 0,
                                 widthConstant: commentsTextFieldWidth,
                                 heightConstant: commentsTextFieldHeight)
        
        
        
    }


}

