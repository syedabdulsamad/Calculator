//
//  ViewController.swift
//  Calculator
//
//  Created by Abdul Samad on 03/04/15.
//  Copyright (c) 2015 Abdul Samad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit =  sender.currentTitle!
        println("digit = \(digit)")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

