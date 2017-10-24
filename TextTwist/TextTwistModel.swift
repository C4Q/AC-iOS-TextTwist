//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct TextTwistModel {
    
    struct TestTwistInfo {
        let wordCount: Int
        let letters: String
        let words: [String]
    }
    
    
    
     let allInfo: [TestTwistInfo] = [
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
    
    func randomNumberUnder3() -> Int {
        return Int(arc4random_uniform(UInt32(allInfo.count)))
    }
    var randWordGroup:Int { return randomNumberUnder3() }
    
    func getRandomWord() -> TestTwistInfo {
//        print(allInfo[Int(randWordGroup)].letters)
//        print(allInfo[Int(randWordGroup)].words)
        dump(allInfo[Int(randWordGroup)])
        return (allInfo[Int(randWordGroup)])
    }
    
    let randWordGroupIndex = Int(arc4random_uniform(3))
    

    
}
