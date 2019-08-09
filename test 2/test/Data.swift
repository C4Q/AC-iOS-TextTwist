//
//  Data.swift
//  test
//
//  Created by Jack Wong on 8/6/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation

struct TestTwistInfo {
    let wordCount: Int
    let letters: String
    let words: [String]
}


class WordData {
    static let allInfo: [TestTwistInfo] = [
        TestTwistInfo(wordCount: 26,
                      letters: "cdenno",
                      words: ["conned", "coden","coned", "donne", "nonce","code","coed","cone","conn","deco","done","neon","node","none","once", "cod","con","den","doc","doe","don","end","eon","nod","ode","one"]),
        TestTwistInfo(wordCount: 17,
                      letters: "ehhssu",
                      words: ["hushes", "shush", "hehs","hues","hush","shes","sues","uses", "ess","heh","hes","hue","huh","she","shh","sue","use"]),
        TestTwistInfo(wordCount: 13,
                      letters: "hisswy",
                      words: ["swishy", "hissy","swish", "hiss","whys","wish","wiss","ywis", "his","shy","sis","why","wis"])
    ]
}
