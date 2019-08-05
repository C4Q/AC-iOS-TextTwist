//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var sample = TextTwistModel()
    
    @IBOutlet weak var letterBank: UILabel!
    @IBOutlet weak var validationMessage: UILabel!
    @IBOutlet weak var userGuess: UITextField!
    @IBOutlet weak var threeLetters: UITextView!
    @IBOutlet weak var fourLetters: UITextView!
    @IBOutlet weak var fiveLetters: UITextView!
    @IBOutlet weak var sixLetters: UITextView!
    
    
    @IBAction func guessInput(_ sender: UITextField) {
        if sample.checkGuess(sender.text!) {
            validationMessage.text = "Correct!"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userGuess.delegate = self
        validationMessage.text = ""
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

