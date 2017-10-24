//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var textTwistInstance = TextTwistModel()
    
    
    @IBOutlet var userCorrectGuesses: [UITextView]!
    @IBOutlet weak var lettersToUse: UILabel!
    @IBOutlet weak var userGuess: UITextField!
    @IBOutlet weak var mssgToUser: UILabel!
    
    
    @IBAction func sendGuess(_ sender: Any) {
        if let attempt = userGuess.text {
            //textTwistInstance.guess(word: attempt)
            var x = 0
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userGuess.delegate = self
    }
    
    //hit return:
    //pass typed in stuff
    //return true or false
    
    //if true
        //add it to correct textView
        //if no more words left
            //say no more words left in mssgToUser
    
    //if false
        //say false in mssgToUser
    
    //delegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendGuess(Int())
        textField.resignFirstResponder()
        return false
    }
    
    
    
}

