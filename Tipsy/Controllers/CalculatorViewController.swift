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
    var billTotal = 0.0
    var totalPeople = 0
    var result = "0.0"
    
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
        
        billTextField.endEditing(true)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        totalPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // print our tip percentage
//        print(tipAmount)
//        print(splitNumberLabel.text!)
//        print(billTextField.text!)
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            result = String(format: "%.2f", (billTotal * (tipAmount + 1.0)) / Double(totalPeople))
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            // as! to force downcast to ResultViewController, the subclass of Viewcontroller
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberOfPeople = totalPeople
            destinationVC.tipPct = tipAmount
            destinationVC.result = result
            
        }
    }
}

