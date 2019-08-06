//
//  ViewController.swift
//  TextTwist
//
//  Created by EricM on 8/5/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var letter: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var word3: UITextView!
    @IBOutlet weak var word4: UITextView!
    @IBOutlet weak var word5: UITextView!
    @IBOutlet weak var word6: UITextView!
    var count = 0
    var currentLetters = ""
    

    override func viewDidLoad() {
        letter.text = WordData.allInfo[count].letters
        super.viewDidLoad()
        input.delegate = self
        currentLetters = WordData.allInfo[count].letters
        // Do any additional setup after loading the view.
    }
    
    func updateLabel() {
        letter.text = currentLetters
    }
    func removeLetter(c: Character) -> Bool {
        guard let removalIndex = currentLetters.lastIndex(of: c) else {return false}
        self.currentLetters.remove(at: removalIndex)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if WordData.allInfo[count].words.contains(textField.text!) && textField.text!.count == 3{
            if !word3.text.contains(textField.text!){
                word3.text += "\(textField.text!)\n"
            }
            else
            {
                message.text = "You already have that!"
            }
            return true
        }
        else if WordData.allInfo[count].words.contains(textField.text!) && textField.text!.count == 4{
            if !word4.text.contains(textField.text!){
                word4.text += "\(textField.text!)\n"
            }
            else
            {
                message.text = "You already have that!"
            }
            return true
        }
        else if WordData.allInfo[count].words.contains(textField.text!) && textField.text!.count == 5{
            if !word5.text.contains(textField.text!){
                word5.text += "\(textField.text!)\n"
            }
            else
            {
                message.text = "You already have that!"
            }
            return true
        }
        else if WordData.allInfo[count].words.contains(textField.text!) && textField.text!.count == 6{
            if !word6.text.contains(textField.text!){
            word6.text += "\(textField.text!)\n"
            }
            else
            {
                message.text = "You already have that!"
            }
        return true
        }
        else {
            message.text = "Wrong Word!"
             return true
        }
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if string.isEmpty{ //this allows backspace but this cause a problem for the next if statement passing backspace and not allowing it going to the line that appends it back
//            return true
//        }
        
        // checks one thing at a time the user enters and then if empty string is "" then it was deleted
        if range.upperBound - range.lowerBound == 1 && string == "" {
            currentLetters.append(textField.text!.last!)
            updateLabel()
            return true
        }
        guard string.count == 1  else{
             return false
        }
        
        if removeLetter(c: Character(string)) {
            updateLabel()
            return true
        } else {
            return false
        }
        
        let characterSetAllowed2 = CharacterSet(charactersIn: WordData.allInfo[count].letters)
        
        if let rangeOfCharactersAllowed = string.rangeOfCharacter(from: characterSetAllowed2, options: .caseInsensitive) {
            // make sure it's all of them
            let validCharacterCount = string.distance(from: rangeOfCharactersAllowed.lowerBound, to: rangeOfCharactersAllowed.upperBound)
            message.text = ""
            return validCharacterCount == string.count
        }
        else  {
            message.text = "Invalid letter"
            // none of the characters are from the allowed set
            return false
        }
    }
    
    
    
}

