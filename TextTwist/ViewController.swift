//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var model = TextTwistModel()
    var data = WordData()
    
    
    @IBOutlet weak var letterBankLabel: UILabel!
    @IBOutlet weak var messagesToTheUserLabel: UILabel!
    
    @IBOutlet weak var textBox: UITextField!
    
    @IBOutlet weak var textViewUpperLeft: UITextView!
    
    @IBOutlet weak var textViewUpperRight: UITextView!
    
    @IBOutlet weak var textViewLowerLeft: UITextView!
    
    @IBOutlet weak var textViewLowerRight: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.randomWord()
        self.textBox.delegate = self
        let topLabel = "Letters: \(model.randomLetters) 😂 Words Left: \(model.randomWordCount)"
        letterBankLabel.text = topLabel
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Should return")
        //we would need the textfield delegate
        guard let text = textBox.text else {
            return false
        }
        model.playerArray = text
        model.correctAnswer()
        textViewUpperLeft.text = model.fieldULAsString
        textViewUpperRight.text = model.fieldURAsString
        textViewLowerLeft.text = model.fieldBLAsString
        textViewLowerRight.text = model.fieldBRAsString
        messagesToTheUserLabel.text = model.guessLabel
        
        
    return true
}
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Begin editing")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did begin editing")
    }
    
}

