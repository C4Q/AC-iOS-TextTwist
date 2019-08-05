//
//  ViewController.swift
//  TextTwist
//
//  Created by Sunni Tang on 08/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var wordBanks: [UITextView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
    }
    
    
    @IBAction func guessWords(_ sender: UITextField) {
    
    }
    
    
    
}

