//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

//handles a specific number of validation answers
enum letterValidation{
    case correct, wrong, alreadyGuessed
}

class TextTwistModel {
    var words = WordData()
    var currentWord: String = ""
    var currentWordGuess: String = ""
    var currentWordList = WordData.allInfo[0]//grabbing the text twist list from data.swift
    var randomWord: [String]
    var currentInfo: TestTwistInfo
    var availableLetterBank: String //is equal to amount of available letters in random word
    var usedLetterBank: String
    var currentLetterGuess: Character = " "
    init(){
        currentInfo = WordData.allInfo[Int(arc4random_uniform(3))] //these are all the letters on allInfo
        randomWord = currentInfo.words
        availableLetterBank = currentInfo.letters
        usedLetterBank = currentInfo.letters
        
    }
    //public api
    
    //validating guess
    func guess(_ currentWordGuess: String) -> letterValidation {
        
        if !randomWord.contains(currentWordGuess){
            return .wrong
        }
        return .correct
    }

    //private api : anything not being used by the view controller
    
    
}
