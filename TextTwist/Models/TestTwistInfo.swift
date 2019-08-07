//
//  TestTwistInfo.swift
//  TextTwist
//
//  Created by Phoenix McKnight on 8/6/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
protocol SomethingWithAWordCount {
    var wordCount:Int? {get set}
}
struct TestTwistInfo:SomethingWithAWordCount {
    var wordCount: Int?
        let letters: String
    let words: [String]
    func verifyGuess(guess: String) -> Bool {
return words.contains(guess)
}

    
}
