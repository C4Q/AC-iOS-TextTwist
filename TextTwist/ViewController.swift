//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
    let game = WordData.getRandom()
    @IBOutlet weak var LettersLabel: UILabel!
    @IBOutlet weak var userInputOut: UITextField!
    @IBOutlet var myTextsFields: [UITextView]!
    @IBOutlet weak var commentsLabel: UILabel!
var wordsUsed = [String]()
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if game.checkInput(word: textField.text!) && !wordsUsed.contains(textField.text!)
        {
            
            wordsUsed.append(textField.text!)
            updateTable(word: textField.text!)
            commentsLabel.text! = "yay you got it"
            
            return true
        }
            commentsLabel.text! = "oh no, its wrong"
        return false
    }
    
    
    func updateTable (word: String){
        if word.count == 3 {
            print("nothing")
            myTextsFields[0].text! +=  word + "\n"
        } else  if word.count == 4 {
            myTextsFields[1].text! += word + "\n"
        }else  if word.count == 5 {
            myTextsFields[2].text! += word + "\n"
        }else  if word.count == 6 {
            myTextsFields[3].text! += word + "\n"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        LettersLabel.text = game.letters
        userInputOut.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if game.letters.contains(string) || string == "" {
            return true
        }
        return false
    }
}
