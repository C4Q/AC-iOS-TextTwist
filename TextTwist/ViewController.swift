//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var info = WordData.allInfo.randomElement()!
    var wordBank = [String]()
    var userBank = [String]()
    var typedChars = String()
    var charCount = 0
    
    @IBOutlet weak var lettersOutlet: UILabel!
    
    @IBOutlet weak var messageOutlet: UILabel!
    
    @IBOutlet weak var threeWordOutlet: UITextView!
    
    @IBOutlet weak var fourWordOutlet: UITextView!
    
    @IBOutlet weak var fiveWordOutlet: UITextView!
    
    @IBOutlet weak var sixWordOutlet: UITextView!
    
    @IBOutlet weak var inputFieldOutlet: UITextField!
    
    
    @IBAction func inputFieldTyped(_ sender: UITextField) {
    }
    
    @IBAction func userIsTyping(_ sender: UITextField) {
    }
    
    
    
    @IBAction func newGameButton(_ sender: UIButton) {
        inputFieldOutlet.isEnabled = true
        threeWordOutlet.text = ""
        fourWordOutlet.text = ""
        fiveWordOutlet.text = ""
        sixWordOutlet.text = ""
        userBank = [String]()
        info = WordData.allInfo.randomElement()!
        lettersOutlet.text! = info.letters
        wordBank = info.words
        messageOutlet.text! = "Guess words using the letters above!"
    }
    
    
    func checkWin() {
        if userBank.sorted() == wordBank.sorted() {
            messageOutlet.text! = "Congratulations! You guessed all the words!"
            inputFieldOutlet.isEnabled = false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if lettersOutlet.text!.contains(string) {
            charCount = lettersOutlet.text!.count
            lettersOutlet.text = lettersOutlet.text!.replacingOccurrences(of: string, with: "")
            typedChars.append(string)
            
            if charCount - lettersOutlet.text!.count != 1 {
                lettersOutlet.text!.append(string)
            }
            
        }
        
        if string == "" {
            if typedChars.isEmpty == false {
            lettersOutlet.text! += String(typedChars.last!)
                typedChars.popLast()
            }
            return true
        }
        
        
        
        
        let characterSetAllowed = CharacterSet(charactersIn: "\(info.letters)")

        if let rangeOfCharactersAllowed = string.rangeOfCharacter(from: characterSetAllowed, options: .caseInsensitive) {
           
            let validCharacterCount = string.distance(from: rangeOfCharactersAllowed.lowerBound, to: rangeOfCharactersAllowed.upperBound)
            return validCharacterCount == string.count
        } else  {
            messageOutlet.text = "You can't use \(string)!"
            return false
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if userBank.contains(textField.text!) {
            messageOutlet.text = "You already guessed that word!"
        }
        
        if info.words.contains(textField.text!.lowercased()) {
            if let input = textField.text?.lowercased() {
                if input.count == 3 && threeWordOutlet.text.contains(input.lowercased()) == false {
                    threeWordOutlet.text.append("\(input)\n" )
                    userBank.append(input)
                    messageOutlet.text = "Correct!"
                    checkWin()
                    return true
                } else if input.count == 4 && fourWordOutlet.text.contains(input.lowercased()) == false {
                    fourWordOutlet.text.append("\(input)\n ")
                    userBank.append(input)
                    messageOutlet.text = "Correct!"
                    checkWin()
                    return true
                } else if input.count == 5 && fiveWordOutlet.text.contains(input.lowercased()) == false {
                    fiveWordOutlet.text.append("\(input)\n ")
                    userBank.append(input)
                    messageOutlet.text = "Correct!"
                    checkWin()
                    return true
                } else if input.count == 6 && sixWordOutlet.text.contains(input.lowercased()) == false {
                    sixWordOutlet.text.append("\(input)\n ")
                    userBank.append(input)
                    messageOutlet.text = "Correct!"
                    checkWin()
                    return true
                }
            }
        } else {
            messageOutlet.text = "Wrong!"
            return true
        }
        
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputFieldOutlet.delegate = self
        
        lettersOutlet.text = info.letters
        
        wordBank = info.words
        
        
    }
}


