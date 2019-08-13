//
//  ViewController.swift
//  TextTwistAtClass
//
//  Created by Kimball Yang on 8/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    // we don't use an instance of WordData
    // instead, with the static property allInfo, we can call WordData.allInfo
    
    
    var currentGame: TestTwistInfo? {
        didSet {
            showAvailableLettersLabel.text = self.currentGame?.letters
        }
    }

    
    @IBOutlet weak var threeLetter: UITextView!
    @IBOutlet weak var fourLetter: UITextView!
    @IBOutlet weak var fiveLetter: UITextView!
    @IBOutlet weak var sixLetter: UITextView!
    
    @IBOutlet weak var showAvailableLettersLabel: UILabel!
   
    
    @IBOutlet weak var userGuessMessageLabel: UILabel!
    @IBOutlet var thisTextField: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBAction func userGuess(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        currentGame = pickNewGame()
        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (currentGame?.letters.contains(string)) ?? false || string == "" {
            print(string)
            return true
        } else {
            return false
        }
    }

    // define a method from the delegate protocol that DOES SOMETHING when I hit enter
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        return true
//    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // we are going to see if the user input is correct
        // based on whether it's correct or not (type Bool)
        // how to determine which text view to put it in?
        // Check word.count then add or append to the textview
        // what if the guess is incorrect, don't update guess views if it's incorrect.
        
        if let inputText = inputTextField.text {
           let result = currentGame?.words.contains(inputText) ??
            false
            if result {
                userGuessMessageLabel.text = "Correct"
                addAnswerToTextView(answer: inputText)
            } else {
                userGuessMessageLabel.text = "Incorrect"
            }
        }
        
        print("return")
        
        return true
    }
    
    // when does this function get called?
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("text field")
    }
    private func pickNewGame() -> TestTwistInfo {
        return WordData.getGameInfo()
    }
  
    private func addAnswerToTextView(answer: String) {
        switch answer.count {
        case 3:
            threeLetter.text.append("\(answer)\n")
        case 4:
            fourLetter.text.append("\(answer)\n")
        case 5:
            fiveLetter.text.append("\(answer)\n")
        case 6:
            sixLetter.text.append("\(answer)\n")
        default:
            userGuessMessageLabel.text = "Well that doesn't work..."
        }
        
    }
}

