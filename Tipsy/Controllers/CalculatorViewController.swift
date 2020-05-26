//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipAmount = 0.1
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    

    @IBAction func tipChanged(_ sender: UIButton) {
        // highlight selected button and deselect the others
        // when any button is selected, the following actions happen
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        // grab the title of the button... can't believe I initially forgot how to do this
        let buttonName = sender.currentTitle!
        
        // drop the % sign from the title and make it a double
        let buttonValue = Double(String((buttonName.dropLast())))!
        
        // calculate the bugger
        tipAmount = buttonValue / 100
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // print our tip percentage
        print(tipAmount)
        print(splitNumberLabel.text!)
    }
}

