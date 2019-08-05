//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

class TextTwistModel {
    var twistArray: TestTwistInfo {
        get { return generateTwist() }
    }
    
    var threeLetterWords = [String]()
    var fourLetterWords = [String]()
    var fiveLetterWords = [String]()
    var sixLetterWords = [String]()
    
    func generateTwist() -> TestTwistInfo {
        return WordData.allInfo.randomElement()!
    }
    
    func doesWordMatch(_ word: String) -> Bool  {
        if twistArray.words.contains(word) {
            switch word.count {
            case 3:
                threeLetterWords.append(word)
                return true
            case 4:
                fourLetterWords.append(word)
                return true
            case 5:
                fiveLetterWords.append(word)
                return true
            case 6:
                sixLetterWords.append(word)
                return true
            default:
                print("wrong")
                return false
            }
        } else {
            return false
        }
        
    }
    
    
}
