//
//  ViewController.swift
//  TipCalc
//
//  Created by Lyragosa on 15/10/19.
//  Copyright © 2015年 Lyragosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    let tipCalc = TipCalculatorModel(total:200,taxPct:0.06)
    
    @IBAction func calculateTapped(sender : AnyObject) {
        saveData();
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        var keys = Array(possibleTips.keys)
        keys.sortInPlace();
        for tipPct in keys {
            let tipValue = possibleTips[tipPct]!
            let predoValue = String(format:"%.2f",tipValue)
            results += "\(tipPct)%: \(predoValue)\n"

        }
        /*
        //old:
        
        for (tipPct, tipValue) in possibleTips {
            let predoValue = String(format:"%.2f",tipValue)
            results += "\(tipPct)%: \(predoValue)\n"
        }*/
        resultsTextView.text = results
    }
    
    func test123(a:Int,b:Int) -> Int {
        return Int(a+b)
    }
    
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        saveData();
        tipCalc.taxPct = Double(taxPctSlider.value)
        refreshUI()
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder();
    }
    
    @IBAction func baseTotalInputed(sender : AnyObject) {
        saveData();
    }
    
    func saveData() {
        tipCalc.total = Double( (totalTextField.text! as NSString).doubleValue )
    }
    
    func refreshUI() {
        totalTextField.text = String(tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct)
        taxPctLabel.text = "Tax (\(Int(taxPctSlider.value * 100.0))%)"
        resultsTextView.text = "";
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

