//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

enum GameResult {
    case correct
    case incorrect
    case used
}

class TextTwistModel {
    //Public API
    var currentLetters: String
    var score: Int = 0
    
    func newGame() {
        let newRandNum = Int(arc4random_uniform(UInt32(WordData.allInfo.count)))
        currentInfo = WordData.allInfo[newRandNum]
        currentLetters = currentInfo.letters
        currentWordList = currentInfo.words
        currentWordListThree = currentWordList.filter{$0.count == 3}
        currentWordListFour = currentWordList.filter{$0.count == 4}
        currentWordListFive = currentWordList.filter{$0.count == 5}
        currentWordListSix = currentWordList.filter{$0.count == 6}
        allThreeWords = false
        allFourWords = false
        allFiveWords = false
        allSixWords = false
        usedWordList = []
        score = 0
    }
    
    func checkWord(_ word: String) -> GameResult {
        switch word {
        case _ where currentWordList.contains(word):
            if usedWordList.contains(word) {
                return .used
            } else {
                usedWordList.append(word)
                switch word.count {
                case 3:
                    score += 3
                case 4:
                    score += 4
                case 5:
                    score += 5
                default:
                    score += 6
                }
                return .correct
            }
        default:
            return .incorrect
        }
    }
    
    func addletter(_ character: Character) {
        currentLetters.append(character)
    }
    
    func removeLetter(_ character: Character) {
        guard let removeIndex = currentLetters.index(of: character) else {
            return
        }
        currentLetters.remove(at: removeIndex)
    }
    
    func allWordsGuessedFor(count: Int) -> Bool {
        switch count {
        case 3 where currentWordListThree.count == usedWordList.filter{$0.count == 3}.count:
            return true
        case 4 where currentWordListFour.count == usedWordList.filter{$0.count == 4}.count:
            return true
        case 5 where currentWordListFive.count == usedWordList.filter{$0.count == 5}.count:
            return true
        case 6 where currentWordListSix.count == usedWordList.filter{$0.count == 6}.count:
            return true
        default:
            return false
        }
    }
    
    func resetLetters() -> String {
        currentLetters = currentInfo.letters
        return currentInfo.letters
    }
    
    //Private Implementation
    private var randNum = Int(arc4random_uniform(UInt32(WordData.allInfo.count)))
    private var currentInfo: TestTwistInfo
    private var currentWordList: [String]
    private var currentWordListThree: [String]
    private var currentWordListFour: [String]
    private var currentWordListFive: [String]
    private var currentWordListSix: [String]
    private var usedWordList: [String] = []
    var allThreeWords = false
    var allFourWords = false
    var allFiveWords = false
    var allSixWords = false
    init() {
        currentInfo = WordData.allInfo[randNum]
        currentLetters = currentInfo.letters
        currentWordList = currentInfo.words
        currentWordListThree = currentWordList.filter{$0.count == 3}
        currentWordListFour = currentWordList.filter{$0.count == 4}
        currentWordListFive = currentWordList.filter{$0.count == 5}
        currentWordListSix = currentWordList.filter{$0.count == 6}
    }
}
