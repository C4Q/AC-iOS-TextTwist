//
//  ViewController.swift
//  TextTwist
//
//  Created by Sunni Tang on 08/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var availableLetters: UILabel!
    @IBOutlet var wordBanks: [UITextView]!
    
    var userGuess: String = ""
    var wordCheck: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        label.text = "Guess words by using the letters below:"
        availableLetters.text = gameModel.allWords.letters
    }
    
    
    
    @IBAction func guessWords(_ sender: UITextField) {
        
        if let senderText = sender.text {
            wordCheck = gameModel.checkGuess(userGuess: senderText)
            userGuess = senderText
            addWordToBank()
        } else {
            label.text = "Must guess a word!"
        }
        
    }
    
    func addWordToBank() {
        if wordCheck {
            //also check to see if letter outside of letters is used
            label.text = "Nice! Keep guessing."
            if userGuess.count == 3 {
                //add to 3 word bank
                wordBanks[0].text = wordBanks[0].text + "\n" + userGuess
            } else if userGuess.count == 4 {
                // add to 4 word bank
                wordBanks[1].text = wordBanks[1].text + "\n" + userGuess
            } else if userGuess.count == 5 {
                // add to 5 word bank
                wordBanks[2].text = wordBanks[2].text + "\n" + userGuess
            } else if userGuess.count == 6 {
                // add to 6 word bank
                wordBanks[3].text = wordBanks[3].text + "\n" + userGuess
            } else {
                // this will not happen
                print("This should not happen")
            }
        } else {
            label.text = "Nope. Try again!"

        }

    }
    
    
}

