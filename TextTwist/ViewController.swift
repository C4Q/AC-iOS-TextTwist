//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    @IBOutlet weak var guess: UILabel!
    
    @IBOutlet weak var threeLetterWords: UITextView!
    @IBOutlet weak var fourLetterTextView: UITextView!
    @IBOutlet weak var fiveLetterTextView: UITextView!
    @IBOutlet weak var sixLetterTextView: UITextView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    let wordData = WordData.allInfo
    
    var currentGame: TestTwistInfo? {
       didSet  {
    guess.text = self.currentGame?.letters
        }
    }
     override func viewDidLoad() {
        currentGame = picNewGame()
       inputTextField.delegate = self
        super.viewDidLoad()
     
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let input = inputTextField.text {
           let result = currentGame?.verifyGuess(guess: input) ?? false
            if result == true {
                if threeLetterWords.text == input || fourLetterTextView.text == input || fiveLetterTextView.text == input || sixLetterTextView.text == input {
                    status.text = "Sorry, you have already used that word"
                } else {
                status.text = "correct"
                addAnswertoTextView(answer: input)
                }
            } else {
             status.text = "incorrect"
            }
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        if (currentGame?.letters.contains(string) ?? false) || string == ""   {
      return true
            
    } else {
    return false
    }
    }
    
    private func picNewGame() -> TestTwistInfo {
        return WordData.getGameInfo() ?? TestTwistInfo(wordCount: 0, letters: "", words: [""])
    }
    private func addAnswertoTextView(answer:String) {
       
        switch answer.count {
        case 3:
        threeLetterWords.text.append(answer)
        case 4:
            fourLetterTextView.text.append(answer)
        case 5:
            fiveLetterTextView.text.append(answer)
        case 6:
            sixLetterTextView.text.append(answer)
        default:
            print("oh well")
    }
    
//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if let guessword = textField.text {
//            let randomWords = model.generatedWord.words.randomElement()
//            if randomWords == guessword {
//                letterWords.text = "\(guessword) \n"
//                print(guessword)
//            } else {
//                status.text = "Not a valid word"
//            }
//        }
//
//        return true
//    }
}






}

