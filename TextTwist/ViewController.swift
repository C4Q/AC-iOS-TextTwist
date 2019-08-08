//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //let wordData = WordData()
    // we don't use an instance of WordData, instead, with the static we would go to the model and make a function/method
    var currentGame: TextTwistInfo? {
        didSet {
            scrambledLetters.text = self.currentGame?.letters
        }
    }
    
    @IBOutlet weak var userGuessMessageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var threeLetterTextView: UITextView!
    @IBOutlet weak var fourLetterTextView: UITextView!
    @IBOutlet weak var fiveLetterTextView: UITextView!
    @IBOutlet weak var sixLetterTextView: UITextView!

    @IBOutlet weak var scrambledLetters: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrambledLetters.text = WordData.allInfo.randomElement()?.letters
    }
}

