//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TextTwistModel {
    var userGuess = String()
    var guessedWords = [String]()
    var typingLetters = String()
    
    
    func checkGuess(userGuess: String) -> Bool {
        return currentGame.words.contains(userGuess)
    }
    
    
    func isDuplicate(userGuess: String) -> Bool {
        return guessedWords.contains(userGuess)
    }
    
    
}

let gameModel = TextTwistModel()
