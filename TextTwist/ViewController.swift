//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var model = TextTwistModel()
    var info: TestTwistInfo!
//text field outlet
    @IBOutlet weak var textFieldOutlet: UITextField!
    //label outlet
    @IBOutlet weak var lettersLeftLabel: UILabel!
    //Outlet for three-letter view
    @IBOutlet weak var textViewThreeLetters: UITextView!
    
    @IBOutlet weak var textViewFourLetters: UITextView!
    
    @IBOutlet weak var textViewSixLetters: UITextView!
    @IBOutlet weak var textViewFiveLetters: UITextView!
    private var allWords = [String]()
    
    
    //Text field action; not used
    @IBAction func enterUserGuess(_ sender: UITextField) {
//        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            if info.words.contains(text) {
                allWords.append(text)
                allWords = Array(Set(allWords))
                print(allWords)
                 addToTxtView()
                
                
            } else {
                print("Incorrect word")
            }
            
            
//            if model.checkGuess(userGuess: text) {
//                textViewThreeLetters.text += textField.text!
//                return true
//            } else {
//                //            lettersLeftLabel.text = "Incorrect"
//                return true
//            }
//        } else {
//            return true
//        }
        }
        return false
    }
    
    private func addToTxtView(){
        for str in allWords {
            if str.count == 3 {
                textViewThreeLetters.text += "\(str) \n"
            } else if str.count == 4 {
                textViewFourLetters.text += "\(str) \n"
            } else if str.count == 5 {
                textViewFiveLetters.text += "\(str) \n"
            } else if str.count == 6{
                textViewSixLetters.text += "\(str) \n"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.info = model.randomInfo
        self.textFieldOutlet.delegate = self
        self.lettersLeftLabel.text = info.letters
        self.textViewThreeLetters.text = ""
        //addToTxtView()
        
//        self.lettersLeftLabel.text = model.getRandomInfo().letters
        // Do any additional setup after loading the view.
        
    }
    
}

