//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
class TextTwistModel {
    var allData = WordData.allInfo
    var wordletter = WordData.allInfo[0].letters
    var randomWordletter = ""
    var randomWordCount = 0
    var randomWordWords = WordData.allInfo[0].words
    func getRandomWord(){
        let random = Int(arc4random_uniform(UInt32(allData.count-1)))
        let randomData = allData[random]
        randomWordletter = randomData.letters
        randomWordCount = randomData.wordCount
        randomWordWords = randomData.words
    }

    func checkWord(inputText:String)->Bool{
        return randomWordWords.contains(inputText)
    }

}
