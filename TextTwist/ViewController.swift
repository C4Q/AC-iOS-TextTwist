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
    
    var availableLetters: String = currentGame.letters
    var inputText: String = ""
    var result: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        label.text = "Guess words by using the letters below:"
        availableLettersLabel.text = availableLetters
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let inputText = textField.text {
            result = gameModel.checkGuess(userGuess: inputText)
            
            if result && !gameModel.isDuplicate(userGuess: inputText) {
                label.text = "Nice! Keep guessing."
                gameModel.guessedWords.append(inputText)
                addAnswerToTextView(answer: inputText)
                
            } else if result && gameModel.isDuplicate(userGuess: inputText) {
                label.text = "You already guessed that word!"
            
            } else {
                label.text = "Nope. Try again!"
            }
        
        } else {
            label.text = "Must guess a word!"
        }
        
        textField.text = ""
        return true
    }
    
    

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let availLettersSet = CharacterSet(charactersIn: availableLetters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return availLettersSet.isSuperset(of: typedCharacterSet)
    }
    
    
    private func addAnswerToTextView(answer: String) {
        switch answer.count {
        case 3:
            wordBanks[0].text = wordBanks[0].text + "\n" + answer
        case 4:
            wordBanks[1].text = wordBanks[1].text + "\n" + answer
        case 5:
            wordBanks[2].text = wordBanks[2].text + "\n" + answer
        case 6:
            wordBanks[3].text = wordBanks[3].text + "\n" + answer
        default:
            fatalError("This shouldn't happen!")
        }
    }
    
    
    private func pickNewGame() -> TestTwistInfo {
        currentGame = WordData.chooseRandomInfo()
        return currentGame
    }

    
    
}

