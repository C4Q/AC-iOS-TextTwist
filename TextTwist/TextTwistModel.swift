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
    
    var randomInfo: TestTwistInfo {
        
       return WordData.allInfo.randomElement()!
        
    }
    
    
    
    func checkGuess(userGuess: String ) -> Bool {
       return  randomInfo.words.contains(userGuess)
        
    }
    
   

    
}



