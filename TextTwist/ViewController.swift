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
    @IBOutlet weak var availableLettersLabel: UILabel!
    @IBOutlet var wordBanks: [UITextView]!
    
    var userGuess: String = ""
    var wordCheck: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        label.text = "Guess words by using the letters below:"
        availableLettersLabel.text = availableLetters
    }
    
    
    @IBAction func guessWords(_ sender: UITextField) {
        
        if let senderText = sender.text {
            userGuess = senderText
            wordCheck = gameModel.checkGuess(userGuess: userGuess)
            
            if wordCheck && !gameModel.isDuplicate(userGuess: userGuess) {
                label.text = "Nice! Keep guessing."
                gameModel.guessedWords.append(userGuess)
                
                switch userGuess.count {
                case 3:
                    wordBanks[0].text = wordBanks[0].text + "\n" + userGuess
                case 4:
                    wordBanks[1].text = wordBanks[1].text + "\n" + userGuess
                case 5:
                    wordBanks[2].text = wordBanks[2].text + "\n" + userGuess
                case 6:
                    wordBanks[3].text = wordBanks[3].text + "\n" + userGuess
                default:
                    fatalError("This shouldn't happen!")
                }
            } else if wordCheck && gameModel.isDuplicate(userGuess: userGuess) {
                label.text = "You already guessed that word!"
            } else {
                label.text = "Nope. Try again!"
            }
            
        } else {
            
            label.text = "Must guess a word!"
            
        }
        
        textField.text = ""
        
    }
    
    
//    func checkForErrors() {
////only let user type letters in the letter bank
//        let userGuessArray = Array(userGuess)
//        var lettersLeft = [String]()
//
//        for char in userGuessArray {
//            if availableLetters.contains(char) {
//
//            }
//        }
//    }
    
    
    
    
    
}

