//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

enum GuessStatus {
    case correct (String)
    case incorrect
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    var guessedWordDictionary = [String:Int]()
    
    @IBOutlet weak var LetterShower: UILabel!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var WordLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    @IBOutlet weak var LetterBox3: UITextView!
    @IBOutlet weak var LetterBox4: UITextView!
    @IBOutlet weak var LetterBox5: UITextView!
    @IBOutlet weak var LetterBox6: UITextView!
    
    
    @IBOutlet weak var FourLetterBox: UITextView!
    
    
    
    
    var delegate: UITextFieldDelegate?
    var randomLetters = ""
    var randomWords = [String]()
    private var score = 0
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        guard !guessedWordDictionary.keys.contains(text) else {return false}
        let guess = checkIfCorrect(input: text)
        pushToCell(guess: guess)
        print(randomWords)
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            guard let text = textField.text else {return false}
            addLetterToBank(text)
            return true
        }
        guard randomLetters.contains(string) else {
            return false
        }
        removeLetterFromBank(letter: string)
        print(range.lowerBound, range.upperBound, string)
        
        
        return true
    }
    
    func removeLetterFromBank(letter: String) {
       let letterIndex = randomLetters.index(of: Character(letter))
        randomLetters.remove(at: letterIndex!)
        LetterShower.text = randomLetters
    }
    
    func addLetterToBank(_ input: String) {
        randomLetters.append(input.last!)
        LetterShower.text = randomLetters
    }
    
    let model = TextTwistModel()
    
    
    func checkIfCorrect(input: String) -> GuessStatus  {
        
        if input.count == 6 {
            print("6")
            let newTextGroup = model.getRandomWord()
            randomLetters = newTextGroup.letters
            randomWords = newTextGroup.words
            LetterShower.text = randomLetters
            TextField.text?.removeAll()
        }
        print(randomLetters)
        switch input {
        case _ where randomWords.contains(input):
            guessedWordDictionary[input] = (guessedWordDictionary[input] ?? 0) + 1
            return GuessStatus.correct(input)
        default:
            return GuessStatus.incorrect
        }
    }
    
    
    func pushToCell(guess: GuessStatus) {
        switch guess {
        case let .correct(input):
            WordLabel.text = "Correct Guess"
            
            switch input.count {
            case 3:
                LetterBox3.text.append("\(input) \n")
                score += 3
                LetterBox3.backgroundColor = UIColor(hue:0.55, saturation:0.62, brightness:0.96, alpha:1.00)
            case 4:
                LetterBox4.text.append("\(input) \n")
                score += 4
                LetterBox4.backgroundColor = UIColor(hue:0.87, saturation:0.44, brightness:0.97, alpha:1.00)
            case 5:
                LetterBox5.text.append("\(input) \n")
                score += 5
                LetterBox5.backgroundColor = UIColor(hue:0.03, saturation:0.84, brightness:0.75, alpha:1.00)
            case 6:
                LetterBox6.text.append("\(input) \n")
                score += 6
                LetterBox6.backgroundColor = UIColor(hue:0.42, saturation:0.69, brightness:0.95, alpha:1.00)
            default:
                print("Default")
            }

        case .incorrect:
            WordLabel.text = "Incorrect Guess"
        }
        
        ScoreLabel.text = String(score)
    }
    
    override func viewDidLoad() {
        self.TextField.delegate = self
        super.viewDidLoad()
        let textGroup = model.getRandomWord()
        randomLetters = textGroup.letters
        randomWords = textGroup.words
        LetterShower.text = randomLetters
    }
    
    
 
}


