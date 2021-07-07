//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = TextTwistModel()
    
    @IBOutlet weak var userInput: UITextField!

    @IBOutlet weak var lettersUsed: UILabel!
    
    @IBOutlet weak var correctOrIncorrectGuessesLabel: UILabel!
    
    @IBOutlet weak var ThreeLetterWords: UITextView!
    
    
    @IBOutlet weak var FourLetterWords: UITextView!
    
    
    @IBOutlet weak var FiveLetterWords: UITextView!
    
    
    @IBOutlet weak var SixLetterWords: UITextView!
    
    
    
    
    @IBAction func getInput(_ sender: UITextField) {
     
        if game.randomGame.words.contains(userInput.text!) {
            correctOrIncorrectGuessesLabel.text = "Correct!"
            if sender.text?.count == 3 {
                ThreeLetterWords.text.append(contentsOf: "\(userInput.text!)\n")
            } else if sender.text?.count == 4 {
                FourLetterWords.text.append(contentsOf: userInput.text!)
            } else if sender.text?.count == 5 {
                FiveLetterWords.text.append(contentsOf: userInput.text!)
            } else if sender.text?.count == 6 {
                SixLetterWords.text.append(contentsOf: userInput.text!)
            }
        } else {
            
            correctOrIncorrectGuessesLabel.text = "Wrong!"
        }
    }
        
//        if game.userInput.contains(game.wordbank) {
//            game.wordbank =
//        }
        
        // if the letter that the user puts is in the wordbank then pluck that letter out of the wordbank
        
  //  }
    
    
    @IBAction func triggeredByEdits(_ sender: UITextField) {
        if let senderText = sender.text{
            let updatedWordBank = game.getWordBank(userInput: senderText)
            lettersUsed.text = updatedWordBank
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lettersUsed.text = game.wordBankInStr
    }
}


//When the user types in a guess into the text field and presses return, they get a message if their guess was correct, or had any errors and then it gets added to the appropriate spot in the UI.

// how do we know if it was correct or not

// if correct how do we add it to the appropriate box

// if correct, second label should show its correct

// what if user put a letter that doesnt belong -> this should be shown in second label

// what if the answer is incorrect -> this should be shown in second label
