//
//  PromiseDetailsViewController.swift
//  MyPromise
//
//  Created by Sam Mahdad on 4/27/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit

class PromiseDetailsViewController: UIViewController {
    var promiseToShow : Promise?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var daysCompletedRatioLabel: UILabel!
    @IBOutlet weak var daysOfActivePromiseLabel: UILabel!
    @IBOutlet weak var daysOfPromise: UILabel!
    @IBOutlet weak var daysCompletedStaticLabel: UILabel!
    @IBOutlet weak var startPromiseLabel: UILabel!
    
    @IBOutlet weak var completedTodayButton: UIButton!
    @IBOutlet weak var completedPromiseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateLabels()
    }
    
    func updateLabels() {
        titleLabel.text = promiseToShow?.title
        descriptionLabel.text = promiseToShow!.descriptionText
        if let checkPromise = promiseToShow as? DailyPromise {
            completedTodayButton.addTarget(self, action: "completeToday", forControlEvents: UIControlEvents.TouchUpInside)
            completedPromiseButton.addTarget(self, action: "completePromise", forControlEvents: UIControlEvents.TouchUpInside)
            
            daysCompletedRatioLabel.text = checkPromise.getDayStats()
            daysOfActivePromiseLabel.text = checkPromise.getDaysOfPromise()
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy" //format style. Browse online to get a format that fits your needs.
            let dateString = dateFormatter.stringFromDate(promiseToShow!.startDate!)
            startPromiseLabel.text = "You started this promise on " + dateString
        } else {
            completedTodayButton.hidden = true
            completedPromiseButton.addTarget(self, action: "completePromise", forControlEvents: UIControlEvents.TouchUpInside)
            var str = "Your Promise is "
            if !promiseToShow!.completed {
                str += "not "
            }
            str += "completed."
            daysCompletedRatioLabel.text = str
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy" //format style. Browse online to get a format that fits your needs.
            let dateString = dateFormatter.stringFromDate(promiseToShow!.startDate!)
            
            daysCompletedStaticLabel.text = ""
            
            if let checkPromise = promiseToShow as? GeoPromise {
                daysOfActivePromiseLabel.text = "This promise is for " + checkPromise.geoName!
            } else {
                daysOfActivePromiseLabel.text = ""
            }
            daysOfPromise.text = ""
            startPromiseLabel.text = "You started this promise on " + dateString
        }
        
        if promiseToShow!.alreadyCompletedPromise() {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy" //format style. Browse online to get a format that fits your needs.
            let dateString = dateFormatter.stringFromDate(promiseToShow!.dateCompleted!)
            startPromiseLabel.text = startPromiseLabel.text! +  " and finished on " + dateString
        }

    }
    
    func completeToday() {
        let promise = promiseToShow as? DailyPromise
        
        if promise!.alreadyCompletedPromise() {
            let alert = UIAlertView()
            alert.title = "Already Completed"
            alert.message = "You already completed this promise! Congratulations."
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        else if promise!.alreadyCompleted() {
            let alert = UIAlertView()
            alert.title = "Already Completed"
            alert.message = "You already completed this promise for today."
            alert.addButtonWithTitle("Ok")
            alert.show()

        } else if !promise!.completeDayPromise() {
            let alert = UIAlertView()
            alert.title = "Wrong Day"
            alert.message = "Today is not one of your days for this promise."
            alert.addButtonWithTitle("Ok")
            alert.show()

        }
        updateLabels()
    }
    
    func completePromise() {
        if promiseToShow!.completePromise() {
            let alert = UIAlertView()
            alert.title = "Already Completed"
            alert.message = "You already completed this promise."
            alert.addButtonWithTitle("Ok")
            alert.show()
            
        }
        updateLabels()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        //        var validItem = 0
        //        var tempList = [ToDoListItem]()
        //        var currRow = 0
        //        for item in toDoListItems {
        //            if item.hasValidDate() || !item.checked {
        //                tempList.append(item)
        //                if item.checked {
        //                    validItem += 1
        //                }
        //            }
        //            currRow += 1
        //        }
        //        self.toDoListItems = tempList
        //        tableView.reloadData()
        
        //        if segue.identifier == "AddSegue" {
        //            var svc = segue!.destinationViewController as? AddPromiseViewController
        ////            svc?.numberOfCompletedTasks = validItem
        ////            svc?.totalNumberOfTasks = self.toDoListItems.count
        //        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
