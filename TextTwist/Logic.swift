//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit


class ModelTingz {


var nextWord = WordData.allInfo.randomElement()

func displayLetters() -> String {
   
    return nextWord!.letters
}


func guess(guessedWord: String) -> Bool {
    if nextWord!.words.contains(guessedWord) {
        return true
    } else {
        return false
    }
}
}


