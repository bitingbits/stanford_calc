//
//  ViewController.swift
//  Calcularor
//
//  Created by mac on 04-09-17.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    let initialValue = "0"
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("\(digit) was called")
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display!.text = textCurrentlyInDisplay + digit
        } else {
            display!.text = digit
            userIsInTheMiddleOfTyping = true
        }
        
    }
    
    var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = true
        if let mathematicalSymbol = sender.currentTitle{
            switch mathematicalSymbol{
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            case "C":
                userIsInTheMiddleOfTyping = false
                display.text = initialValue
            default:
                break;
                
            }
        }
        
        
    }

}

