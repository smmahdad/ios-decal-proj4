//
//  CurrentPromisesController.swift
//  MyPromise
//
//  Created by Sam Mahdad on 4/27/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit
import CoreData

class CurrentPromisesController: UITableViewController {
    var currentPromises = [Promise]()
    var completedPromises = [Promise]()
    var currBoolFlag = true
    var nextWindow : PromiseDetailsViewController?
    
    @IBOutlet weak var uncompletedSegControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        currBoolFlag = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch uncompletedSegControl.selectedSegmentIndex {
        case 0:
//            print("Hey")
            currBoolFlag = true
            cycleCompleted()
        case 1:
//            print("Here")
            currBoolFlag = false
            cycleUncompleted()
        default:
            break;
        }
        self.tableView.reloadData()
    }
    
    func cycleUncompleted() {
        var tempCurrProm = [Promise]()
        
        for elem in currentPromises {
            if elem.completed {
                completedPromises.append(elem)
            } else {
                tempCurrProm.append(elem)
            }
        }
        currentPromises = tempCurrProm
    }
    
    func cycleCompleted() {
        var tempCompProm = [Promise]()
        
        for elem in completedPromises {
            if !elem.completed {
                currentPromises.append(elem)
            } else {
                tempCompProm.append(elem)
            }
        }
        completedPromises = tempCompProm
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
        
        if segue.identifier == "DetailedPromise" {
            nextWindow = segue!.destinationViewController as? PromiseDetailsViewController
        } else if segue.identifier == "MapSegue" {
            if currBoolFlag {
                cycleUncompleted()
            } else {
                cycleCompleted()
            }
            
            var tempProm = [GeoPromise]()
            
            for elem in currentPromises {
                if let something = elem as? GeoPromise {
                    tempProm.append(something)
                }
            }
            
            var svc = segue!.destinationViewController as? MapPromisesViewController
            svc?.geoProm = tempProm
        }
    }
    
    @IBAction func prepareForSaveUnwind(something: UIStoryboardSegue) {
        
//        if let svc = something.sourceViewController as? AddItemViewController {
//            let itemNameFromSegue = svc.itemName
//            let itemDateFromSegue = svc.itemDate
//            
//            let tempItem = ToDoListItem(text: itemNameFromSegue, paramDate: itemDateFromSegue)
//            toDoListItems.append(tempItem)
//            self.tableView.reloadData()
//        }
        
        if let svc = something.sourceViewController as? AddPromiseViewController {
            let promise = svc.newPromise
            currentPromises.append(promise!)
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func prepareForCancelUnwind(something: UIStoryboardSegue) {
        
        //        if let svc = something.sourceViewController as? AddItemViewController {
        //            let itemNameFromSegue = svc.itemName
        //            let itemDateFromSegue = svc.itemDate
        //
        //            let tempItem = ToDoListItem(text: itemNameFromSegue, paramDate: itemDateFromSegue)
        //            toDoListItems.append(tempItem)
        //            self.tableView.reloadData()
        //        }
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if currBoolFlag {
            return currentPromises.count
        } else {
            return completedPromises.count
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("APromise", forIndexPath: indexPath)
        let item:Promise
        if currBoolFlag {
            item = currentPromises[indexPath.row]
        } else {
            item = completedPromises[indexPath.row]
        }
        
        
        configureTextForCell(cell, promiseItem: item)
//        decideCheckmark(cell, index: indexPath.row)
        
        // Configure the cell...
        
        return cell
    }
    
    func configureTextForCell(cell: UITableViewCell, promiseItem: Promise) {
        let label = cell.viewWithTag(100) as! UILabel
        label.text = promiseItem.title!
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
//        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        let item:Promise
        if currBoolFlag {
            item = currentPromises[indexPath.row]
        } else {
            item = completedPromises[indexPath.row]
        }
        
//        item.completed = !item.completed
//        if item.completed {
////            item.updateDate()
//        }
//        decideCheckmark(cell, index: indexPath.row)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
//        let destination = storyboard.instantiateViewControllerWithIdentifier("DetailView") as! PromiseDetailsViewController
        nextWindow!.promiseToShow = item
//        navigationController?.pushViewController(destination, animated: true)
        
        
    }
    
    //    @IBAction func addItem(sender: AnyObject?) {
    //        let newRowIndex = toDoListItems.count
    //        let item = ToDoListItem(text: "New item", checked: false)
    //        toDoListItems.append(item)
    //        let indexPathToAdd = NSIndexPath(forRow: newRowIndex, inSection: 0)
    //        tableView.insertRowsAtIndexPaths([indexPathToAdd], withRowAnimation: UITableViewRowAnimation.Automatic)
    //    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        if currBoolFlag {
            currentPromises.removeAtIndex(indexPath.row)
        } else {
            completedPromises.removeAtIndex(indexPath.row)
        }
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }


}

