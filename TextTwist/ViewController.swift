//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var currentLetterMessage: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var textViews: [UITextView]!
    @IBOutlet weak var gameMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }
    
    var game = TextTwistModel()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        if game.checkInputAgainstPossibleWords(text) == true {
            
            switch text.count {
            case 3:
                textViews[0].text = (textViews[0].text + "\n" + text)
            case 4:
                textViews[1].text = (textViews[1].text + "\n" + text)
            case 5:
                textViews[2].text = (textViews[2].text + "\n" + text)
            case 6:
                textViews[3].text = (textViews[3].text + "\n" + text)
            default:
                break
            }
        }
  
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
    

}

