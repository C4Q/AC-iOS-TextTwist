//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TextTwistModel {
    var testCase = WordData.allInfo.randomElement()!
    
    func checkGuess(_ guess: String) -> Bool {
        return self.testCase.words.contains(guess.lowercased())
    }
}
