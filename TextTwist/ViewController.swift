//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usedLetterBank: UILabel!
    @IBOutlet weak var availableLetterBank: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var wordJumble: UILabel!
    @IBOutlet weak var guessText: UITextField!
    
    @IBOutlet weak var threeWordTextView: UITextView!
    @IBOutlet weak var fourWordTextView: UITextView!
    @IBOutlet weak var fiveWordTextView: UITextView!
    @IBOutlet weak var sixWordTextView: UITextView!
    
    var gameRules = TextTwistModel()
    
    //setting up func to conform to UITFdelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        guessText.delegate = self
        messageLabel.isHidden = true
        wordJumble.text = gameRules.currentInfo.letters //replace word jumble label with random word
        availableLetterBank.text = "Available letters: \(gameRules.currentInfo.letters)"
        //usedLetterBank.text = "Used letters: \(gameRules.currentInfo.letters)"
    }
    
    //checks every letter
    //string --. is the letter you enter
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !gameRules.availableLetterBank.contains(gameRules.currentLetterGuess) {
            messageLabel.text = "Can't use \(string)."
            messageLabel.isHidden = false
            return true
        }
        return false
    }
    
    //textfield return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(gameRules.currentWordList)
        gameRules.currentWordGuess = textField.text!
        //make sure there is text in the text field otherwise return false
        guard let text = textField.text else{
            return false
        }
//        guard (3...6).contains(gameRules.currentWord.count) else {
//            messageLabel.isHidden = false
//            messageLabel.text = "Word must be 3,4,5 or 6 letters long."
//            return true
//        }
//
    
        //text --> entire string when user presses enter
        switch gameRules.guess(text) {
        case .correct:
            messageLabel.text = "Correct!"
            messageLabel.isHidden = false
            //putting word in appropriate textview box
            switch gameRules.currentWordGuess.count {
            case 3:
                threeWordTextView.text.append(gameRules.currentWordGuess + "\n")
            case 4:
                fourWordTextView.text.append(gameRules.currentWordGuess + "\n")
            case 5:
                fiveWordTextView.text.append(gameRules.currentWordGuess + "\n")
            case 6:
                sixWordTextView.text.append(gameRules.currentWordGuess + "\n")
            default:
                messageLabel.text = "Try Again."
            }
        case .wrong:
            messageLabel.text = "Wrong!"
            messageLabel.isHidden = false
        case .alreadyGuessed:
            messageLabel.text = "Word already guessed. Choose another word."
            messageLabel.isHidden = false
        }

    
        
        textField.resignFirstResponder()
        return true
    }
    
}// end of class

