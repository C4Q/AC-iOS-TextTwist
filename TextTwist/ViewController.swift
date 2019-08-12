//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    var letters = ModelTingz()
    var noLetters: String = ""
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let userInput = userInput.text {
            let result =  
        }
        
        
    } // we are going to see if the guess is correct -> look at textfield.text
    //based on whether ists correct or not (type bool)
    //if true, give a message that they were correct, and then aff that guess into the appropriate text view
    //how to determine which text view to put it in? check word.count (see how many words) and add/append to the appropriate text view
    //if the guess is incorrect, dont update text view with the guess, do update the label
    
    @IBOutlet weak var resu: UILabel!
    @IBOutlet weak var currentLetters: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    private func pickNewGame() -> TestTwistInfo {
        return TestTwistInfo(wordCount: 1, letters: "", words: [""])
    }
    
    @IBAction func afterReturnIsPressed(_ sender: UITextField) {
        if letters.guess(guessedWord: sender.text!) == true {
            resu.text = "You are correct!"
        } else {
            resu.text = "You are incorrect!"
        }
    }
    @IBOutlet var wordsGuessed: [UITextView]!
    
    func noMoreLetters(sender: UITextField) {
        if sender.text!.contains(noLetters){
            resu.text = "You can't do that!"
        }
        
    }
    
    @IBAction func wrongLetterTyped(_ sender: UITextField) {
        noMoreLetters(sender: sender)
    }
    
override func viewDidLoad() {
    currentLetters.text = letters.displayLetters()
  //  noLetters = resu.text!
  //  resu.text = noLetters.
    super.viewDidLoad()
    
    
    }
    @IBAction func userLetters(_ sender: UITextField) {
        userInput.text = sender.text
    }
    
    
}

