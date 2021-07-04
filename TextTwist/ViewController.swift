//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lettersLabel: UILabel!
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var threeWordTextView: UITextView!
    @IBOutlet weak var fourWordTextView: UITextView!
    @IBOutlet weak var fiveWordTextView: UITextView!
    @IBOutlet weak var sixWordTextView: UITextView!
    @IBOutlet weak var newGameButton: UIButton!
    
    var textViews: [UITextView] = []
    var model = TextTwistModel()
    
    override func viewDidLoad() {
        newGame()
        textViews = [threeWordTextView, fourWordTextView, fiveWordTextView, sixWordTextView]
        roundEdgesOf(textViews, newGameButton)
        roundEdgesOf([resultTextView])
        super.viewDidLoad()
        guessTextField.delegate = self
    }
    
    @IBAction func newGamePressed(_ sender: Any) {
        //put stuff that will reset the game and change the letters
        newGame()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let _ = Int(string) {
            return false
        }
        
        guard var _ = lettersLabel.text, let textField = textField.text else {
            return false
        }
        
        if string == "" && textField.count >= 1 {
            model.addletter(textField.last!)
            lettersLabel.text = model.currentLetters
            return true
        }
        
        if model.currentLetters.contains(string) {
            model.removeLetter(Character(string))
            lettersLabel.text = model.currentLetters
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //make sure text is really a text, unwrap
        guard let text = textField.text?.lowercased() else {
            return false
        }
        
        if text.count < 3 || text.count > 6 {
            resultTextView.text = "Smh that wasn't even 3-6 letters 😒"
            return false
        }
        
        switch model.checkWord(text) {
        case .correct:
            resultTextView.text = "Congrats!! You guessed it right!!! 😂"
            switch text.count {
            case 3:
                threeWordTextView.text.append("\(text)\n")
            case 4:
                fourWordTextView.text.append("\(text)\n")
            case 5:
                fiveWordTextView.text.append("\(text)\n")
            default:
                sixWordTextView.text.append("\(text)\n")
            }
            scoreLabel.text = "Score: \(model.score)"
        case .incorrect:
            resultTextView.text = "Sorry, you got it wrong!!!!!! 😂"
            return false
        case .used:
            resultTextView.text = "You've already used this word smh 😒"
            return false
        }
        
        if model.allWordsGuessedFor(count: 3) && !model.allThreeWords {
            threeWordTextView.backgroundColor = UIColor.init(red: 0.925, green: 0.673, blue: 0.709, alpha: 1)
            resultTextView.text = "Congrats!! You got all the three letter words 😂"
            model.allThreeWords = true
        }
        
        if model.allWordsGuessedFor(count: 4) && !model.allFourWords {
            fourWordTextView.backgroundColor = UIColor.init(red: 0.902, green: 0.965, blue: 0.905, alpha: 1)
            resultTextView.text = "Congrats!! You got all the four letter words 😂"
            model.allFourWords = true
        }
        
        if model.allWordsGuessedFor(count: 5) && !model.allFiveWords {
            fiveWordTextView.backgroundColor = UIColor.init(red: 0.574, green: 0.757, blue: 0.965, alpha: 0.7)
            resultTextView.text = "Congrats!! You got all the five letter words 😂"
            model.allFiveWords = true
        }
        
        if model.allWordsGuessedFor(count: 6) && !model.allSixWords {
            sixWordTextView.backgroundColor = UIColor.init(red: 1.0, green: 0.933, blue: 0.782, alpha: 1)
            resultTextView.text = "Congrats!! You got all the six letter words 😂 Resetting..."
            model.allSixWords = true
            perform(#selector(newGame), with: nil, afterDelay: 10)
        }
        
        textField.text = ""
        lettersLabel.text = model.resetLetters()
        textField.resignFirstResponder()
        return true
    }
    
    @objc func newGame() {
        model.newGame()
        lettersLabel.text = model.currentLetters
        textViews.forEach{
            $0.text = ""
            $0.backgroundColor = .white
        }
        resultTextView.text = "Make a 3, 4, 5, or 6-lettered word using the letters above."
        guessTextField.text = ""
        scoreLabel.text = "Score: \(model.score)"
    }
    
    func roundEdgesOf(_ textViews: [Any]? = nil, _ button: Any? = nil) {
        textViews?.forEach{
            guard let textView = $0 as? UITextView else {
                return
            }
            textView.layer.cornerRadius = 20
            textView.layer.masksToBounds = true
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor.init(red: 0.745, green: 0.278, blue: 0.309, alpha: 1).cgColor
        }
        
        guard let roundButton = button as? UIButton else {
            return
        }
        roundButton.layer.cornerRadius = 10
        roundButton.layer.masksToBounds = true
        roundButton.layer.borderWidth = 1
        roundButton.layer.borderColor = UIColor.init(red: 0.745, green: 0.278, blue: 0.309, alpha: 1).cgColor
    }
}

