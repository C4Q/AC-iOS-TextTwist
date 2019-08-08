//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//


import Foundation

struct TestTwistInfo {
    let wordCount: Int
    let letters: String
    let words: [String]
    
   
    func checkInput (word: String)-> Bool{
        if words.contains(word){
            print(true)
            return true
        }
        print(false)
        return false
    }
}


