//
//  SettingsViewController.swift
//  
//
//  Created by Aashima Garg on 12/29/15.
//
//

protocol CreateSettingsViewControllerDelegate: class {
    func userChangedADefault(tip: Double)
}
import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControlCopy: UISegmentedControl!
    @IBOutlet weak var yuckSet: UITextField!
    @IBOutlet weak var tastefulSet: UITextField!
    @IBOutlet weak var devineSet: UITextField!
    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var yuckLabel: UILabel!
    @IBOutlet weak var tasteLabel: UILabel!
    @IBOutlet weak var devineLabel: UILabel!

    var newYuckVal = 0
    var newTasteVal = 0
    var newDevineVal = 0
    
    weak var delegate: CreateSettingsViewControllerDelegate?
    var defaultTip = 0.18
    
    @IBAction func newDefault(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        defaultTip = tipPercentages[tipControlCopy.selectedSegmentIndex]
        
        //saving the defualt tip
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControlCopy.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
        
    }
    
    @IBAction func newYuck(sender: AnyObject) {
        
        newYuckVal = NSString (string: yuckSet.text).integerValue
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(newYuckVal, forKey: "new_yuck")
        defaults.synchronize()
    
         tipControlCopy.setTitle("\(newYuckVal)%", forSegmentAtIndex: 0)
        
    }
 
    @IBAction func yuckClick(sender: AnyObject) {
        tipControlCopy.hidden = true
        defaultLabel.hidden = true
        tastefulSet.hidden = true
        tasteLabel.hidden = true
        devineSet.hidden = true
        devineLabel.hidden = true
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

    
    @IBAction func newTasteVal(sender: AnyObject) {
        
        newTasteVal = NSString (string: tastefulSet.text).integerValue
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(newTasteVal, forKey: "new_taste")
        defaults.synchronize()
        
        tipControlCopy.setTitle("\(newTasteVal)%", forSegmentAtIndex: 1)
        
    }
    
    @IBAction func tasteClick(sender: AnyObject) {
        
        tipControlCopy.hidden = true
        defaultLabel.hidden = true
        yuckSet.hidden = true
        yuckLabel.hidden = true
        devineSet.hidden = true
        devineLabel.hidden = true

        
    }
    
    @IBAction func newDevine(sender: AnyObject) {
        
       newDevineVal = NSString (string: devineSet.text).integerValue
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(newDevineVal, forKey: "new_devine")
        defaults.synchronize()
        
       tipControlCopy.setTitle("\(newDevineVal)%", forSegmentAtIndex: 2)
        
    }
    
    @IBAction func devineClick(sender: AnyObject) {
        tipControlCopy.hidden = true
        defaultLabel.hidden = true
        tastefulSet.hidden = true
        tasteLabel.hidden = true
        yuckSet.hidden = true
        yuckLabel.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        newYuckVal = defaults.integerForKey("new_yuck")
        newTasteVal = defaults.integerForKey("new_taste")
        newDevineVal = defaults.integerForKey("new_devine")
        
        var setDefaultTip = defaults.integerForKey("default_tip_percentage")
        
        tipControlCopy.selectedSegmentIndex = setDefaultTip
        
        println(setDefaultTip)
        
        if newYuckVal == 0 {
            tipControlCopy.setTitle("18%", forSegmentAtIndex: 0)
        }
        else {
            tipControlCopy.setTitle("\(newYuckVal)%", forSegmentAtIndex: 0)
        }
        if newTasteVal == 0 {
            tipControlCopy.setTitle("20%", forSegmentAtIndex: 1)
            
        }
        else {
            tipControlCopy.setTitle("\(newTasteVal)%", forSegmentAtIndex: 1)
        }
        if self.newDevineVal == 0 {
            tipControlCopy.setTitle("22%", forSegmentAtIndex: 2)
        }
        else {
            tipControlCopy.setTitle("\(newDevineVal)%", forSegmentAtIndex: 2)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
         view.endEditing(true)
        
        
        tipControlCopy.hidden = false
        defaultLabel.hidden = false
        yuckSet.hidden = false
        yuckLabel.hidden = false
        tastefulSet.hidden = false
        tasteLabel.hidden = false
        devineSet.hidden = false
        devineLabel.hidden = false
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
