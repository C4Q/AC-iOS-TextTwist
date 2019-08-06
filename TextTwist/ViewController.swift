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
        
        //let guessedWord = sender.text!
        let doesWordHaveAMatch = model.doesWordMatch(sender.text!)
    
        if doesWordHaveAMatch {
            
            if sender.text!.count == 3 {
                letterWords[0].text.append("\(sender.text!)\n")
            }
            letterWords[1].text = "does"
            letterWords[2].text = "hello"
            letterWords[3].text = "planet"
            }
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model.twistArray.words)
        guess.text = model.generateTwist().letters
    }
}

