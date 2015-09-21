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
    var isDecimalValue = false
    var userIsTying = false
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if(userIsTying){
            enter()
        }
        switch (operation){
            case "×":
                performOperation {$0 * $1}
            case "−":
                performOperation {$1 - $0}
            case "+":
                performOperation {$0 + $1}
            case "÷":
                performOperation {$1 / $0}
            case "√":
                performOperation() {sqrt($0)}
            case "sin":
                performOperation() {sin($0)}
            case "cos":
                performOperation() {cos($0)}
        default: break
        }
    }
    
    @IBAction func clearOperands(sender: UIButton) {
        display.text = "0"
        isDecimalValue = false
        userIsTying = false
        operandStack.removeAll(keepCapacity: false)
    }
    @IBAction func appendDecimal(sender: UIButton) {
        if(isDecimalValue){
            return
        }
        isDecimalValue = true
        appendDigit(sender)
    }
    
    @IBAction func removeDigit() {
        var updatedText = display.text!
        if updatedText.characters.count <= 1 {
            display.text! = "0"
            userIsTying = false
            return
        }
        updatedText = display.text!.substringWithRange(Range<String.Index>(start: updatedText.startIndex, end: updatedText.endIndex.advancedBy(-1)))
        display.text = updatedText;
    }
    @IBAction func appendDigit(sender: UIButton) {
        let digit =  sender.currentTitle!
        print("digit = \(digit)")
        if(!userIsTying){
            userIsTying = true
            display.text = sender.currentTitle!
        } else{
            display.text = display.text! + sender.currentTitle!
        }
        
        
    }
    
    var displayValue : Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue;
        }
        set{
            userIsTying = false
            display.text = "\(newValue)"
        }
    }
    var operandStack = Array<Double>()
    @IBAction func enter() {
        userIsTying = false
        operandStack.append(displayValue)
        print("operandstack : \(operandStack)" )
    }
    
    @IBAction func equals() {
        userIsTying = false
        print("operandstack : \(operandStack)")
        evaluate()
        
        
        
    }
    
    func evaluate() {
    }
    
    func performOperation(operation: (Double, Double) ->Double){
        if (operandStack.count >= 2){
            displayValue = operation( operandStack.removeLast() , operandStack.removeLast())
            enter()
        }
    }
    @nonobjc
    func performOperation(operation: Double ->Double){
        if (operandStack.count >= 1){
            displayValue = operation( operandStack.removeLast())
            enter()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

