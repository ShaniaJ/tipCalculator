//
//  ViewController.swift
//  tipCalculator
//
//  Created by Shania Joseph on 11/2/20.
//


import UIKit



class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipControlSlider: UISlider!
    
    @IBOutlet weak var increasePersonArrow: UIButton!
    @IBOutlet weak var decreasePersonArrow: UIButton!
    @IBOutlet weak var splitPersonCounter: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    //let currencies = [...]
    var tipPercentages : [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //creating tip percentage array
        for i in 0..<3 {
            var rawNum = tipControl.titleForSegment(at: i)
            rawNum = rawNum?.replacingOccurrences(of: "%", with: "")
            let finalNum = Double(rawNum!)
            tipPercentages.append((finalNum!/100))
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //first segment changed
        let updatedFirstDefaultTip = defaults.string(forKey: "updatedFirstDefaultTip") ?? "0%"
        if (updatedFirstDefaultTip != "0%") {
            tipControl.setTitle(updatedFirstDefaultTip, forSegmentAt: 0)
            let rawFN = updatedFirstDefaultTip.replacingOccurrences(of: "%", with: "")
            let doubleFN = Double(rawFN)
            tipPercentages[0] = (doubleFN!/100)
        }
        
        //second segment changed
        let updatedSecondDefaultTip = defaults.string(forKey: "updatedSecondDefaultTip") ?? "0%"
        if (updatedSecondDefaultTip != "0%") {
            tipControl.setTitle(updatedSecondDefaultTip, forSegmentAt: 1)
            let rawSN = updatedSecondDefaultTip.replacingOccurrences(of: "%", with: "")
            let doubleSN = Double(rawSN)
            tipPercentages[1] = (doubleSN!/100)
        }
        
        //third segment changed
        let updatedThirdDefaultTip = defaults.string(forKey: "updatedThirdDefaultTip") ?? "0%"
        if (updatedThirdDefaultTip != "0%") {
            tipControl.setTitle(updatedThirdDefaultTip, forSegmentAt: 2)
            let rawTN = updatedThirdDefaultTip.replacingOccurrences(of: "%", with: "")
            let doubleTN = Double(rawTN)
            tipPercentages[2] = (doubleTN!/100)
        }
        
        
        //updating total and tip with new value(s) passed because a new value might currently be selected
        //Get bill amount
        let bill = Double(billField.text!) ?? 0

        //Calculate tip and total

        var tip : Double

        if (tipControl.selectedSegmentIndex == 0) {
            tipControlSlider.value = Float(tipPercentages[0] * 100)
        } else if (tipControl.selectedSegmentIndex == 1) {
            tipControlSlider.value = Float(tipPercentages[1] * 100)
        } else if (tipControl.selectedSegmentIndex == 2) {
            tipControlSlider.value = Float(tipPercentages[2] * 100)
        }
        tip = bill * tipPercentages[tipControl.selectedSegmentIndex]

        let total = bill + tip

        //Update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        //Update total per person label
        let numOfPeople = Int(splitPersonCounter.text!)
        let totalPerPerson = total / Double(numOfPeople!)
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
       
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    

    @IBAction func calculateTipSegment(_ sender: Any) { //when segmented control used for tip
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        
        //Calculate tip and total

        var tip : Double

        if (tipControl.selectedSegmentIndex == 0) {
            tipControlSlider.value = Float(tipPercentages[0] * 100)
        } else if (tipControl.selectedSegmentIndex == 1) {
            tipControlSlider.value = Float(tipPercentages[1] * 100)
        } else if (tipControl.selectedSegmentIndex == 2) {
            tipControlSlider.value = Float(tipPercentages[2] * 100)
        }
        tip = bill * tipPercentages[tipControl.selectedSegmentIndex]

        let total = bill + tip

        //Update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let numOfPeople = Int(splitPersonCounter.text!)
        splitPersonCounter.text = String(numOfPeople!)
        let totalPerPerson = total / Double(numOfPeople!)
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
    }
    
    
    
    @IBAction func calculateTipSlider(_ sender: Any) { //when slider used for tip
        
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        
        //Calculate tip and total
        var tip : Double
        
        if Double(tipControlSlider.value) >= tipPercentages[0] * 100.0  && Double(tipControlSlider.value) < tipPercentages[1] * 100.0 {
            tipControl.selectedSegmentIndex = 0
        } else if (Double(tipControlSlider.value) >=  tipPercentages[1] * 100.0 && Double(tipControlSlider.value) < tipPercentages[2] * 100.0){
            tipControl.selectedSegmentIndex = 1
        } else if (Double(tipControlSlider.value) >=  tipPercentages[2] * 100.0) {
            tipControl.selectedSegmentIndex = 2
        }
        tip = bill *  (Double(tipControlSlider.value) / 100.0)
        let total = bill + tip
        
        
        //Update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
        let numOfPeople = Int(splitPersonCounter.text!)
        splitPersonCounter.text = String(numOfPeople!)
        let totalPerPerson = total / Double(numOfPeople!)
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
        
    }
    
    
    @IBAction func personsIncreased(_ sender: Any) {
        let numOfPeople = Int(splitPersonCounter.text!)
        
        //Update counter being displayed (splitPersonCounter)
        splitPersonCounter.text = String(numOfPeople! + 1)
        
        
        //Calculate total per person
        var totalStripped = totalLabel.text
        totalStripped = totalStripped?.replacingOccurrences(of: "$", with: "")
        let doubleTotalStripped = Double(totalStripped ?? "0") ?? 0
        
        let totalPerPerson = doubleTotalStripped / Double(numOfPeople!+1)

        //display total per person
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
    }
    
    
    @IBAction func personsDecreased(_ sender: Any) {
        let numOfPeople = Int(splitPersonCounter.text!)
        
        //Update counter being displayed (splitPersonCounter)
        if (Int(splitPersonCounter.text ?? "1") == 1) {
            splitPersonCounter.text = String(1)
        } else {
            splitPersonCounter.text = String(numOfPeople! - 1)
        }
        
        
        //Calculate total per person
        var totalStripped = totalLabel.text
        totalStripped = totalStripped?.replacingOccurrences(of: "$", with: "")
        let doubleTotalStripped = Double(totalStripped ?? "0") ?? 0
        
        var totalPerPerson : Double
        if (Int(numOfPeople ?? 1) - 1) == 0 {
            totalPerPerson = doubleTotalStripped / Double(numOfPeople!)
        } else {
            totalPerPerson = doubleTotalStripped / Double(numOfPeople!-1)
        }

        //display total per person
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passing value of first segment for placeholder
        let SettingsViewController = segue.destination as? SettingsViewController
        let rawPercent0 = tipControl.titleForSegment(at: 0)
        SettingsViewController?.firstTipSlot = rawPercent0
        
        //passing value of second segment for placeholder
        let rawPercent1 = tipControl.titleForSegment(at: 1)
        SettingsViewController?.secondTipSlot = rawPercent1
        
        //passing value of third segment for placeholder
        let rawPercent2 = tipControl.titleForSegment(at: 2)
        SettingsViewController?.thirdTipSlot = rawPercent2
    }
    
    
}

