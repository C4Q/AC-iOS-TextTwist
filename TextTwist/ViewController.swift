//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //let wordData = WordData()
    // we don't use an instance of WordData, instead, with the static we would go to the model and make a function/method
    var currentGame: TextTwistInfo? {
        didSet {
            scrambledLetters.text = self.currentGame?.letters
        }
    }
    
    @IBOutlet weak var userGuessMessageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var threeLetterTextView: UITextView!
    @IBOutlet weak var fourLetterTextView: UITextView!
    @IBOutlet weak var fiveLetterTextView: UITextView!
    @IBOutlet weak var sixLetterTextView: UITextView!

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let inputText = inputTextField.text {
            let result = currentGame?.verifyGuess(guess: inputText) ?? false
            if result {
                userGuessMessageLabel.text = "correct"
                addAnswerToTextView(answer: inputText)
            } else {
                userGuessMessageLabel.text = "incorrect guess, never give up"
            }
        }
        
        // we are going to see if the guess is correct -> look at textfield.text
        //base on if its correct or not
        
        // if true- message correct
        // add to appropriate text view
        
        // how to determin which text view to put it in check word.count (see how many wordsand add or append )
        // if the guess is incorrect, dont apdate text view with guess , do update the label - correct guess
        print("return")
        return true
    }
    
    
    @IBOutlet weak var scrambledLetters: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        currentGame = pickNewGame()
    }
    
    private func pickNewGame() -> TextTwistInfo {
        return WordData.getGameInfo()
    }
    
   private func addAnswerToTextView(answer: String) {
        switch answer.count {
        case 3:
            threeLetterTextView.text.append("\(answer)\n")
        case 4:
            fourLetterTextView.text.append("\(answer)\n")
        case 5:
            fiveLetterTextView.text.append("\(answer)\n")
        case 6:
            sixLetterTextView.text.append("\(answer)\n")
        default:
            print("not a word between 3 and 6 letters")
        }
    }
}

