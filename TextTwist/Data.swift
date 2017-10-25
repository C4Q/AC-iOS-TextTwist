//
//  Data.swift
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
}


class WordData {
    static let allInfo: [TestTwistInfo] = [
        TestTwistInfo(wordCount: 27,           letters: "cdenno",           words: ["conned", "coden","coned", "donne", "nonce","code","coed","cone","conn","deco","done","neon","node","none","once", "cod","con","den","doc","doe","don","end","eon","nod","ode","one"]),
        TestTwistInfo(wordCount: 18,           letters: "ehhssu",           words: ["hushes", "shush", "hehs","hues","hush","shes","sues","uses", "ess","heh","hes","hue","huh","she","shh","sue","use"]),
        TestTwistInfo(wordCount: 14,           letters: "hisswy",           words: ["swishy", "hissy","swish", "hiss","whys","wish","wiss","ywis", "his","shy","sis","why","wis"]),
        TestTwistInfo(wordCount: 22,           letters: "aaghin",           words: ["aahing", "again", "agha", "agin", "anga", "gain", "hang", "nigh", "aah", "aga", "aha", "ain", "ana", "ani", "gan", "ghi", "gin", "hag", "hin", "nag", "nah"]),
        TestTwistInfo(wordCount: 19,           letters: "aaiils",           words: ["aaliis", "aalii", "alias", "aals", "ails", "alas", "ilia", "sail", "sial", "aal", "aas", "ail", "ais", "ala", "als", "las", "lis", "sal"]),
        TestTwistInfo(wordCount: 49,           letters: "aabelt",           words: ["ablate", "abate", "alate", "blate", "bleat", "tabla", "table", "abet", "able", "alae", "alba", "baal", "bale", "bate", "beat", "belt", "beta", "blae", "blat", "blet", "late", "tael", "tala", "tale", "teal", "tela",       "aal", "aba", "ala", "alb", "ale", "alt", "ate", "baa", "bal", "bat", "bel", "bet", "eat", "eta", "lab", "lat", "lea", "let", "tab", "tae", "tea", "tel"]),
        TestTwistInfo(wordCount: 41, letters: "aabort", words: [ "abator", "rabato", "abort", "aorta", "boart", "rabat", "tabor", "boar", "boat", "bora", "bort", "bota", "brat", "rato", "rota", "taro", "tora", "aba", "abo", "arb", "art", "baa", "bar", "bat", "boa", "bot", "bra", "bro", "oar", "oat", "ora", "orb", "ort", "rat", "rob", "rot", "tab", "tao", "tar", "tor"]),
        TestTwistInfo(wordCount: 37,           letters: "abbesy",           words: ["abbeys", "abbes", "abbey", "abyes", "babes", "abbe", "abye", "abys", "ayes", "babe", "baby", "base", "bays", "beys", "byes", "easy", "ebbs", "eyas", "sabe", "yeas", "abs", "aby", "aye", "ays", "bae", "bas", "bay", "bey", "bye", "bys", "ebb", "sab", "sae", "say", "sea", "yea", "yes"]),
        TestTwistInfo(wordCount: 69,           letters: "abdeir",           words: ["abider", "abide", "aider", "aired", "ardeb", "barde", "bared", "beard", "bider", "braid", "bread", "bride", "deair", "debar", "irade", "rabid", "rebid", "redia", "abed", "abri", "aide", "arid", "bade", "bard", "bare", "bead", "bear", "bide", "bier", "bird", "brad", "brae", "bred", "brie", "darb", "dare", "dear", "dire", "drab", "drib", "idea", "ired", "raid", "read", "ride", "aid", "air", "arb", "are", "bad", "bar", "bed", "bid", "bra", "dab", "deb", "dib", "die", "ear", "era", "ire", "rad", "reb", "red", "rei", "ria", "rib", "rid"]),
        TestTwistInfo(wordCount: 52,           letters: "deilmt",           words: ["milted", "demit", "limed", "tilde", "tiled", "timed", "deil", "deli", "diel", "diet", "dime", "dite", "edit", "emit", "idem", "idle", "item", "lied", "lime", "lite", "meld", "melt", "mild", "mile", "milt", "mite", "tide", "tied", "tile", "time", "del", "die", "dim", "dit", "eld", "elm", "led", "lei", "let", "lid", "lie", "lit", "med", "mel", "met", "mid", "mil", "ted", "tel", "tie", "til"]),
        TestTwistInfo(wordCount: 31,           letters: "cdeimn",           words: ["minced", "denim", "medic", "mince", "mined", "cedi", "cine", "dice", "dime", "dine", "emic", "iced", "idem", "mend", "mice", "mien", "mind", "mine", "nice", "nide", "den", "die", "dim", "din", "end", "ice", "med", "men", "mid", "nim"]),
        TestTwistInfo(wordCount: 29, letters: "aimmos", words: ["mimosa", "ammos", "imams", "maims", "miasm", "aims", "amis", "ammo", "imam", "maim", "miso", "moas", "momi", "moms", "sima", "soma", "aim", "ais", "ami", "ism", "mas", "mim", "mis", "moa", "mom", "mos", "oms", "sim"])
    ]
}
