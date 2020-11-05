//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Shania Joseph on 11/3/20.
//

import UIKit



class SettingsViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var firstDefaultTipSlot: UITextField!
    @IBOutlet weak var secondDefaultTipSlot: UITextField!
    @IBOutlet weak var thirdDefaultTipSlot: UITextField!
    
    @IBOutlet weak var currencyPicker: UIPickerView!

    
    
    var firstTipSlot: String?
    var secondTipSlot: String?
    var thirdTipSlot: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        firstDefaultTipSlot.attributedPlaceholder = NSAttributedString(string: firstTipSlot!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        secondDefaultTipSlot.attributedPlaceholder = NSAttributedString(string: secondTipSlot!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        thirdDefaultTipSlot.attributedPlaceholder = NSAttributedString(string: thirdTipSlot!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTapsettings(_ sender: Any) {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func defaultTipChangedOne(_ sender: Any) {
        defaults.set(firstDefaultTipSlot.text, forKey: "updatedFirstDefaultTip")
        defaults.synchronize()
    }
    @IBAction func defaultTipChangedTwo(_ sender: Any) {
        defaults.set(secondDefaultTipSlot.text, forKey: "updatedSecondDefaultTip")
        defaults.synchronize()
    }
    @IBAction func defaultTipChangedThree(_ sender: Any) {
        defaults.set(thirdDefaultTipSlot.text, forKey: "updatedThirdDefaultTip")
        defaults.synchronize()
    }
    

    
    
    


}
