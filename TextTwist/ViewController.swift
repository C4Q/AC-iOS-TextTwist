//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var correctIncorrectMessage: UILabel!
    
    @IBOutlet weak var scrambledWordLabel: UILabel!
    
    @IBOutlet weak var wordBankLabel: UILabel!
    @IBOutlet weak var hiddenWordArrayLabel: UILabel!
    
    
    @IBOutlet weak var correctWordListLabel: UILabel!
    
    let wordData = WordData()
        
        let randomInfo = WordData.allInfo.randomElement()
        
        var inputLetterArray = [String]()
        var scrambledLetterArray = [String]()
        
        var words = [String]()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            words = randomInfo?.words ?? [String]()
            scrambledWordLabel.text = randomInfo?.letters
            inputText.delegate = self
            astrics()
            if let scrambled = randomInfo?.letters {
                for letter in scrambled {
                    scrambledLetterArray.append(String(letter))
                }
            }
            print(scrambledLetterArray)
        }
        
        @IBAction func resetGame(_ sender: UIButton) {
        }
        
        func astrics() {
            
            if let arrayOfWords = randomInfo?.words {
                let arrayOfAst = arrayOfWords.map { String(repeating: "*", count: $0.count)}
                print(arrayOfAst)
                wordBankLabel.text = arrayOfAst.joined(separator: " ")
            }
            
        }
        
        
        func removeLetter(_ letter: String) {
            scrambledWordLabel.text = scrambledLetterArray.joined()
        }
        
        func enterWasPressed() {
            scrambledLetterArray.removeAll()
            scrambledWordLabel.text = randomInfo?.letters
            if let scrambled = randomInfo?.letters {
                for letter in scrambled {
                    scrambledLetterArray.append(String(letter))
                }
            }
        }
        var arrayOfCorrect = [String]()
        
        func removeAsterics() {
            
            //        let guess = inputText.text ?? ""
            
            //        var randomWords = randomInfo?.words ?? [""]
            //            for word in randomWords {
            //                if word == guess {
            //                    if let index = randomWords.firstIndex(of: word) {
            //                        randomWords.remove(at: index)
            //                        break
            //                    }
            //                }
            //            }
            //        let arrayOfAst = randomWords.map { String(repeating: "*", count: $0.count)}
            //        wordBankLabel.text = arrayOfAst.joined(separator: " ")
        }
        
        func checkGuess() {
            let guess = inputText.text ?? ""
            
            if words.contains(guess) {
                arrayOfCorrect.append(guess)
                print("correct")
            } else {
                print("incorrect")
            }
            
            correctWordListLabel.text = arrayOfCorrect.joined(separator: " ")
        }
    }

    extension ViewController: UITextFieldDelegate {
        
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            print("textFieldShouldBeginEditing")
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            print("textFieldDidBeginEditing")
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            print("shouldChangeCharactersIn")
            
            if !scrambledLetterArray.contains(string) {
                return false
            }
            
            inputLetterArray.append(string)
            for letter in scrambledLetterArray {
                if letter == string {
                    if let index = scrambledLetterArray.firstIndex(of: letter) {
                        scrambledLetterArray.remove(at: index)
                        break
                    }
                }
            }
            print(scrambledLetterArray)
            print(inputLetterArray)
            removeLetter(string)
            
            return true
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            let guess = textField.text ?? ""
            // var wordList = words // 25
            if words.contains(guess) {
                checkGuess()
                words.removeAll(where: { (string) -> Bool in
                    guess == string
                })
                
            }
            
            let arrayOfAst = words.map { String(repeating: "*", count: $0.count)}
            print(arrayOfAst.count)
            wordBankLabel.text = arrayOfAst.joined(separator: " ")
            textField.resignFirstResponder()
            removeAsterics()
            textField.text = ""
            enterWasPressed()
            return true
        }
    }
