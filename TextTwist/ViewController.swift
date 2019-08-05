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
        
        for amtOfLetters in letterWords {
            if amtOfLetters.tag == 3 {
                amtOfLetters.text.append(sender.text!)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guess.text = model.generateTwist().letters
    }
    

}

