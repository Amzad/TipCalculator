//
//  ViewController.swift
//  TipCalculator
//
//  Created by Amzad Chowdhury on 9/15/18.
//  Copyright © 2018 Amzad Chowdhury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmount: UITextField!
    
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var partyCount: UISlider!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    let step: Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
   

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.25]
        
        let roundedValue = round(partyCount.value / step) * step
        partyCount.value = roundedValue
        partyLabel.text = "Party Size: " + String(NSInteger(partyCount.value))
        
        let bill = Double(billAmount.text!) ?? 0
        let tip = bill * tipPercentages[tipSegment.selectedSegmentIndex]
        let total = (bill + tip) / Double(partyCount.value)
        tipAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
        
        
    }

}

