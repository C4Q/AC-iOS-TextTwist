//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrambledLetters: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrambledLetters.text = WordData.allInfo.randomElement()?.letters
    }
}

