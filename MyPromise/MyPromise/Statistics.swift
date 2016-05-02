//
//  Statistics.swift
//  MyPromise
//
//  Created by Sam Mahdad on 4/27/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit
import CoreData

class Statistics : NSManagedObject {
    var daysCompleted: Int?
    var dateStarted: NSDate?
    var lastDateCompleted: NSDate?
    var dateDone: NSDate?
    
    
    init(date: NSDate?) {
        daysCompleted = 0
        dateStarted = date
    }
    
    func getTotalDays() -> Int {
        if dateDone != nil {
            return daysApart(dateStarted!, secondDate:dateDone) + 1
        }
        return daysApart(dateStarted!, secondDate:NSDate()) + 1
        
    }
    
    private func daysApart(firstDate: NSDate?, secondDate: NSDate?) -> Int {
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components([.Day], fromDate: firstDate!, toDate: secondDate!, options: [])
        
        return components.day
    }
    
    func completedTodaysPromise() {
        if lastDateCompleted == nil || daysApart(lastDateCompleted, secondDate: NSDate()) > 0 {
            daysCompleted = daysCompleted! + 1
            lastDateCompleted = NSDate()
        }
    }
    
    func doneForToday() -> Bool {
        if lastDateCompleted == nil {
            return false
        }
        return daysApart(lastDateCompleted, secondDate: NSDate()) == 0
    }
    
    func completion(date: NSDate?) {
        dateDone = date
    }
}