//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var message: UILabel!
    
    
    @IBOutlet weak var ChoosenWord: UILabel!
    
    @IBOutlet weak var textInputField: UITextField!
    @IBOutlet weak var textView1: UITextView!
    
    @IBOutlet weak var textView2: UITextView!
    
    @IBOutlet weak var textView3: UITextView!
    @IBOutlet weak var textView4: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textInputField.delegate = self
        myModel.getRandomWord()
        ChoosenWord.text = myModel.randomWordletter
        message.text = "Please enter the words possible combination above"
    }
    let myModel = TextTwistModel()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let stored = textField.text else{
            return false
        }
        guard stored.contains(myModel.randomWordletter) else{
            return false
        }
        if myModel.checkWord(inputText: stored) == true{
                switch stored.count{
                case 3:
                    textView1.text.append(stored + " ")
                    message.text = "that is right"
                textField.resignFirstResponder()
                case 4:
                    textView2.text.append(stored + " ")
                    message.text = "that is right"
                    textField.resignFirstResponder()
                case 5:
                    textView3.text.append(stored + " ")
                    message.text = "that is right"
                    textField.resignFirstResponder()
                    
                default:
                    textView4.text.append(stored + " ")
                    message.text = "that is right"
                    textField.resignFirstResponder()
            }
            
        }
        else{
            message.text = "\(stored) is not valid, the word is \(myModel.randomWordletter)"
            return false
        }
        return true
    }
    
}

