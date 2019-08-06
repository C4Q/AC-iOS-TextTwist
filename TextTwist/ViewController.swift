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
    
    let gameModel = TextTwistModel()
    var currentGame = WordData.chooseRandomInfo()
    var inputText: String = ""
    var result: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        label.text = "Guess words by using the letters below:"
        availableLettersLabel.text = currentGame.letters
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let inputText = textField.text {
            result = gameModel.checkGuess(userGuess: inputText, currentGame: currentGame)
            
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
        let availLettersSet = CharacterSet(charactersIn: currentGame.letters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return availLettersSet.isSuperset(of: typedCharacterSet)
    }
    
    
    private func addAnswerToTextView(answer: String) {
        switch answer.count {
        case 3:
            wordBanks[0].text.append("\(answer)\n")
        case 4:
            wordBanks[1].text.append("\(answer)\n")
        case 5:
            wordBanks[2].text.append("\(answer)\n")
        case 6:
            wordBanks[3].text.append("\(answer)\n")
        default:
            fatalError("This shouldn't happen!")
        }
    }
    
    
    private func pickNewGame() -> TestTwistInfo {
        currentGame = WordData.chooseRandomInfo()
        return currentGame
    }

    
    
}

