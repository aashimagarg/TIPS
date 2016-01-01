//
//  ViewController.swift
//  tips1
//
//  Created by Aashima Garg on 12/29/15.
//  Copyright (c) 2015 Aashima Garg. All rights reserved.
//

// HELLO! I HAVE ONE BUG THAT AFTER MANY HOURS OF DELETING, READDING, GOOGLING, AND THINKING, I COULD NOT FIX. I HOPE THAT IF I HAVE THE OPPORTUNITY OF PARTIPICATING IN CODEPATH, I WILL LEARN HOW TO AVOID SUCH BUGS IN THE FUTURE. NORMALLY, WHEN A USER TRIES TO TYPE IN A BILL AMOUNT, THE KEYBOARD POPS UP, THE VIEW IS SHIFTED UPWARD, AND THE SEGMENTED CONTROL AND LABELS FOR TIP AND TOTAL APPEAR. HOWEVER, IF THE KEYBOARD IS OPEN (A USER IS TYPING IN A BILL AMOUNT) AND THEN THE USER TRIES TO SWITCH TO SETTINGS AND THEN BACK, THE VIEW SHIFTS DOWNWARD. THE DOWNWARD SHIFT SHOULD NOT HAPPEN. I JUST WANTED TO EXPLAIN THE SMALL DYSFUNCTIONALITY. HOPEFULLY, THIS SMALL BUG DOES NOT HINDER ME IN THE CODEPATH APPLICATION PROCCESS. THANK YOU SO MUCH FOR YOUR CONSIDERATION!

import UIKit

class ViewController: UIViewController, CreateSettingsViewControllerDelegate {

    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var equalSign: UILabel!
    @IBOutlet weak var plusSign: UILabel!
    
    var tipPercentages = [0.18, 0.20, 0.22]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        plusSign.hidden = true
        equalSign.hidden = true
        totalLabel.hidden = true
        tipLabel.hidden = true
        tipControl.hidden = true
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        

    
    
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var yuckValue = defaults.integerForKey("new_yuck")
        var tasteValue = defaults.integerForKey("new_taste")
        var devineValue = defaults.integerForKey("new_devine")
        var defaultPercent = defaults.integerForKey("default_tip_percentage")
        
        self.view.frame.origin = self.view.center
        
        tipControl.selectedSegmentIndex = defaultPercent
        
        if yuckValue == 0 {
            tipControl.setTitle("18%", forSegmentAtIndex: 0)
        }
        else {
            tipControl.setTitle("\(yuckValue)%", forSegmentAtIndex: 0)
            tipPercentages[0] = Double(yuckValue) * 0.01
        }
        if tasteValue == 0 {
            tipControl.setTitle("20%", forSegmentAtIndex: 1)

        }
        else {
            tipControl.setTitle("\(tasteValue)%", forSegmentAtIndex: 1)
            tipPercentages[1] = Double(tasteValue) * 0.01
        }
        if devineValue == 0 {
            tipControl.setTitle("22%", forSegmentAtIndex: 2)
        }
        else {
            tipControl.setTitle("\(devineValue)%", forSegmentAtIndex: 2)
            tipPercentages[2] = Double(devineValue) * 0.01
        }
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString (string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
        
    }
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y -= keyboardSize.height - 150
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y += keyboardSize.height - 150
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentage1 = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString (string: billField.text).doubleValue
        var tip = billAmount * tipPercentage1
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        plusSign.hidden = true
        equalSign.hidden = true
        totalLabel.hidden = true
        tipLabel.hidden = true
        tipControl.hidden = true
    }
   
    
    @IBAction func onEdit(sender: AnyObject) {
        
        plusSign.hidden = false
        equalSign.hidden = false
        totalLabel.hidden = false
        tipLabel.hidden = false
        tipControl.hidden = false
       
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // The destination is actually a navigation controller (see the storyboard).
        let destination = segue.destinationViewController as! SettingsViewController
        // Inside the navigation controller, the first and only child will be our Create controller
        destination.delegate = self
    }
    func userChangedADefault(tip: Double) {
       
        //figure out how to change default tip value
    }

    
    
}

