//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var model = TextTwistModel()
    
    @IBOutlet var letterWords: [UITextView]!
    @IBOutlet weak var guess: UILabel!
    
    @IBAction func guesses(_ sender: UITextField) {
        
        model.doesWordMatch(sender.text!)
        print(model.threeLetterWords)
        print(model.fourLetterWords)
        print(model.fiveLetterWords)
        print(model.sixLetterWords)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model.twistArray.words)
        guess.text = model.generateTwist().letters
    }
    

}

