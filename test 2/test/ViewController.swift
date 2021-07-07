//
//  ViewController.swift
//  test
//
//  Created by Jack Wong on 8/6/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var currentLetterLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var threeTextView: UITextView!
    
    @IBOutlet weak var fourTextView: UITextView!
    @IBOutlet weak var fiveTextView: UITextView!
    @IBOutlet weak var sixTextView: UITextView!
    
    var startModel = TextTwistModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        currentLetterLabel.text = startModel.lettersSoFar
        // Do any additional setup after loading the view.
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if string.isEmpty {
                guard let text = textField.text else {return false}
                startModel.addLetterToBank(text)
                currentLetterLabel.text = startModel.lettersSoFar
                return true
            }
            guard startModel.lettersSoFar.contains(string) else {
                return false
            }
            startModel.removeLetterFromBank(letter: string)
            currentLetterLabel.text = startModel.lettersSoFar
            print(range.lowerBound, range.upperBound, string)
            return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        threeTextView.text = textField.text!
//        return true
        guard let inputWord = textField.text else {
            return false
        } //input has to be between 3-6 letters
        guard (3...6).contains(inputWord.count) else {
            messageLabel.isHidden = false
            messageLabel.text = "You must enter between 3-6 characters"
            return false
        } //check for duplicate
        if startModel.listOfAnswersSoFar.contains(inputWord.lowercased()) {
            messageLabel.isHidden = false
            messageLabel.text = "You guessed \(inputWord) already."
            return false
        } //Check if it's a valid answer
        if startModel.isAnswer(inputWord.lowercased()) {
            messageLabel.isHidden = false
            messageLabel.text = "Yay, you got it!"
            switch inputWord.count {
            case 3:
                threeTextView.text = threeTextView.text + "\n" + inputWord
            case 4:
                fourTextView.text = fourTextView.text + "\n" + inputWord
            case 5:
                fiveTextView.text = fiveTextView.text + "\n" + inputWord
            case 6:
                sixTextView.text = sixTextView.text + "\n" + inputWord
            default:
                fatalError("Meh")
            }
        } else {
            messageLabel.isHidden = false
            messageLabel.text = "\(inputWord) is not an answer"
        }
        textField.resignFirstResponder()

        startModel.reset()
        currentLetterLabel.text = startModel.lettersSoFar
        inputTextField.text = ""
        return true
    }
    
    
    
    
    
}

