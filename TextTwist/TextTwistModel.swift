//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct TheWord {
    var wordData: TestTwistInfo
    var wordCount: Int
    var possibleLetters: String
    var possibleWords: [String] = []
    
    init() {
        let randomizer = Int(arc4random_uniform(3))
        let randomIndex = WordData.allInfo[randomizer]
        wordData = randomIndex
        wordCount = wordData.wordCount
        possibleLetters = wordData.letters
        possibleWords = wordData.words
    }
}

class TextTwistModel {
    
    var currentWord = TheWord()
    
    func checkInputAgainstPossibleWords(_ string: String) -> Bool {
        return currentWord.possibleWords.contains(string)
    }
    
    enum GuessResult: String {
        case correct = "You guessed correctly!"
        case incorrect = "You guessed incorrectly!"
    }
}

