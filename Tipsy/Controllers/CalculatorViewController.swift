//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    
    var tipAmount: Double = 0.1
    var splitValue: Double = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitStepper.value = splitValue
    }


    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        deselectAllTipButtons()
        sender.isSelected = true
        
        let tipStrValue = String(sender.currentTitle!.dropLast())
        tipAmount = Double(tipStrValue)! / 100
    }
    
    @IBAction func stepperVAlueChanged(_ sender: UIStepper) {
        splitValue = sender.value
        splitNumberLabel.text = String(format: "%.0f", splitValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = Double(billTextField.text!) ?? 0
        let billTotalWithTip = billTotal + billTotal * tipAmount
        let amountOwed = (billTotalWithTip / splitValue).rounded()
        print(amountOwed)
    }
    
    private func deselectAllTipButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

