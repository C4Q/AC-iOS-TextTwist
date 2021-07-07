//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TextTwistModel {
    
    struct TestTwistInfo {
        let wordCount: Int
        let letters: String
        let words: [String]
        
    }
    
    class WordData {
        static let allInfo: [TestTwistInfo] = [
            TestTwistInfo(wordCount: 27,
                          letters: "cdenno",
                          words: ["conned", "coden","coned", "donne", "nonce","code","coed","cone","conn","deco","done","neon","node","none","once", "cod","con","den","doc","doe","don","end","eon","nod","ode","one"]),
            TestTwistInfo(wordCount: 18,
                          letters: "ehhssu",
                          words: ["hushes", "shush", "hehs","hues","hush","shes","sues","uses", "ess","heh","hes","hue","huh","she","shh","sue","use"]),
            TestTwistInfo(wordCount: 14,
                          letters: "hisswy",
                          words: ["swishy", "hissy","swish", "hiss","whys","wish","wiss","ywis", "his","shy","sis","why","wis"])
        ]
    }
    var playerArray = String()
    var randomWordCount = Int()
    var randomLetters = String()
    var randomWords = [String]()
    var correctlyGuessedWordsArray = [String]()
    func randomWord() {
        let allInfoIndex = WordData.allInfo.count
        let randomIndex = WordData.allInfo[Int(arc4random_uniform(UInt32(allInfoIndex)))]
        randomWordCount = randomIndex.wordCount
        randomLetters = randomIndex.letters
        randomWords = randomIndex.words
        
    }
    var textFieldUL: [String] = []
    var fieldULAsString = String()
    var textFieldUR: [String] = []
    var fieldURAsString = String()
    var textFieldBL: [String] = []
    var fieldBLAsString = String()
    var textFieldBR: [String] = []
    var fieldBRAsString = String()
    var guessLabel = String()
    func correctAnswer() {
        if Array(textFieldBR).contains(playerArray), Array(textFieldUR).contains(playerArray), Array(textFieldBL).contains(playerArray), Array(textFieldUL).contains(playerArray) {
            guessLabel = "You said that already!"
            playerArray = ""
        }
        if fieldULAsString.contains(playerArray), fieldURAsString.contains(playerArray), fieldBLAsString.contains(playerArray), fieldBRAsString.contains(playerArray) {
            guessLabel = "You said that already!"
            playerArray = ""
        }
        if randomWords.contains(playerArray) {
            correctlyGuessedWordsArray.append(playerArray)
            guessLabel = "Correct!"
            for words in correctlyGuessedWordsArray {
                switch words {
                case _ where words.count == 3:
                    textFieldUL.append(words)
                case _ where words.count == 4:
                    textFieldUR.append(words)
                case _ where words.count == 5:
                    textFieldBL.append(words)
                default:
                    textFieldBR.append(words)
                }
            }
            fieldULAsString = textFieldUL.joined(separator: ", ")
            fieldURAsString = textFieldUR.joined(separator: ", ")
            fieldBLAsString = textFieldBL.joined(separator: ", ")
            fieldBRAsString = textFieldBR.joined(separator: ", ")
        } else {
            guessLabel = "Try Again!"
        }
        playerArray = ""
    }
}
