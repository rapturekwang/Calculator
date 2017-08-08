//
//  ViewController.swift
//  Calculator
//
//  Created by kwanghee jeong on 2017. 8. 8..
//  Copyright © 2017년 kwnag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var display: UILabel!
    
    private var isTyping: Bool = false

    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isTyping {
            let textCurrentlyDisplay = display.text!
            display.text = textCurrentlyDisplay + digit
        } else {
            display.text = digit
        }
        isTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if isTyping {
            brain.setOperand(operand: displayValue)
            isTyping = false
        }
        if let mathmaticalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathmaticalSymbol)
        }
        displayValue = brain.result
    }

}

