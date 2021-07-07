//
//  TestTwistInfo.swift
//  TextTwist
//
//  Created by Sunni Tang on 8/6/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation

struct TestTwistInfo {
    let wordCount: Int
    let letters: String
    let words: [String]
    
    func verifyGuess(guess: String) -> Bool{
        return words.contains(guess)
    }
    
}
