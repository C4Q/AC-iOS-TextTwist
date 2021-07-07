//
//  TextTwistModel.swift
//  test
//
//  Created by Jack Wong on 8/6/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation

class TextTwistModel {
    var lettersInfo: TestTwistInfo
    var listOfAnswersSoFar = Set<String>()
    var lettersSoFar = String()
    
    func isAnswer(_ word: String) -> Bool {
        if lettersInfo.words.contains(word){
            listOfAnswersSoFar.insert(word)
            return true
        }
        return false  //return true if word is valid, otherwise false
    }
    
    func reset(){
        self.lettersSoFar = lettersInfo.letters} //reset set of letters

    func removeLetterFromBank(letter: String) {
        let letterIndex = lettersSoFar.firstIndex(of: Character(letter))
        lettersSoFar.remove(at: letterIndex!)
    }
    
    func addLetterToBank(_ input: String) {
        lettersSoFar.append(input.last!)
    }
    
    init() {
        let number = Int(arc4random_uniform(3))
        self.lettersInfo = WordData.allInfo[number]
        self.lettersSoFar = WordData.allInfo[number].letters
    }
}


