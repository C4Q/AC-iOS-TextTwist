//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TextTwistModel {
    // use info of date to create the logic behind the game
    var randomGame: TestTwistInfo
    
    var wordBankInChar: [Character]
    
    var wordBankInStr : String
    
    var userInput: String
    
    
    
    
    init() {
        self.randomGame = WordData.allInfo.randomElement()!
        self.wordBankInChar = Array(self.randomGame.letters)
        self.wordBankInStr = self.randomGame.letters
        self.userInput = ""
    }
    
    func getWordBank(userInput: String) -> String {
        var userInputDict = [Character : Int]()
        
        for char in userInput {
            if let charCount = userInputDict[char] {
                userInputDict[char] = charCount + 1
            } else {
                userInputDict[char] = 1
            }
        }
        var buildingString = ""
        
        for char in wordBankInStr {
            
            if let charCount = userInputDict[char] {
                userInputDict[char] = charCount - 1
            } else {
                buildingString.append(char)
            }
        }
        return buildingString
    }
  

    
}
