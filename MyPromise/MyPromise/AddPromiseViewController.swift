//
//  AddPromiseViewController.swift
//  MyPromise
//
//  Created by Sam Mahdad on 4/27/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit

class AddPromiseViewController: UIViewController {
    var newPromise: Promise?
    var booleanDays : [Bool]?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var sundaySwitch: UISwitch!
    @IBOutlet weak var mondaySwitch: UISwitch!
    @IBOutlet weak var tuesdaySwitch: UISwitch!
    @IBOutlet weak var wednesdaySwitch: UISwitch!
    @IBOutlet weak var thursdaySwitch: UISwitch!
    @IBOutlet weak var fridaySwitch: UISwitch!
    @IBOutlet weak var saturdaySwitch: UISwitch!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier! == "Save" {
            
            if updateDaysReturnDaily() {
                newPromise = DailyPromise(titleInput: titleTextField.text, descriptionInput: descriptionTextField.text, promiseDays: booleanDays)
            } else if !addressTextField.text!.isEmpty {
                newPromise = GeoPromise(titleInput: titleTextField.text, descriptionInput: descriptionTextField.text, geoName: addressTextField.text)
            }else {
                newPromise = OneTimePromise(titleInput: titleTextField.text, descriptionInput: descriptionTextField.text)
            }
        }
//        self.itemName = itemNameTextBox.text
//        self.itemDate = NSDate()
    }

    func updateDaysReturnDaily() -> Bool {
        booleanDays = [Bool]()
        booleanDays!.append(sundaySwitch.on)
        booleanDays!.append(mondaySwitch.on)
        booleanDays!.append(tuesdaySwitch.on)
        booleanDays!.append(wednesdaySwitch.on)
        booleanDays!.append(thursdaySwitch.on)
        booleanDays!.append(fridaySwitch.on)
        booleanDays!.append(saturdaySwitch.on)
        
        var dailyProm = false
        for elem in booleanDays! {
            if elem == true {
                dailyProm = true
            }
        }
        return dailyProm
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "Save" {
            
            if (titleTextField.text!.isEmpty || descriptionTextField.text!.isEmpty) {
                
                let alert = UIAlertView()
                alert.title = "No Text"
                alert.message = "Please Enter Text In Title and Description"
                alert.addButtonWithTitle("Ok")
                alert.show()
                
                return false
            } else if (updateDaysReturnDaily() && !addressTextField.text!.isEmpty) {
                let alert = UIAlertView()
                alert.title = "Days or Locations"
                alert.message = "Please only enter the days for the promise or the location of the promise."
                alert.addButtonWithTitle("Ok")
                alert.show()
                return false
            }
                
            else {
                return true
            }
        }
        
        // by default, transition
        return true
    }
}
