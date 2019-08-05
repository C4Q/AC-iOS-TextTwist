//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TextTwistModel {
    var userGuess: String = ""
    var allWords = dataModel.chooseRandomInfo()
    
    func checkGuess(userGuess: String) -> Bool {
        if allWords.words.contains(userGuess) {
            return true
        } else {
            return false
        }
    }
    
    
    
    
}

let gameModel = TextTwistModel()
