//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TextTwistModel {
    let allWords = dataModel.getRandom()
    
    func checkInput (word: String) -> Bool{
if allWords.words.contains(word){
     print(true)
            return true
        }
          print(false)
        return false
      
    }}

