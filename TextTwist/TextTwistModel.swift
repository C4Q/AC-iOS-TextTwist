//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TextTwistModel {
    let correctWords: Set<String>
    let acceptableCharacters: [Character]
    var guessesSoFar: Set<String> = Set<String>()
    init(){
        let tempTextTwistInfo = WordData.allInfo[Int(arc4random_uniform(UInt32(WordData.allInfo.count)))]
        correctWords = Set(tempTextTwistInfo.words)
        acceptableCharacters = Array(tempTextTwistInfo.letters)
    }
    
    //public api
    func guess(word: String) {
        
        
        
    }
    
    //private api
    
    
}
