//
//  DailyPromise.swift
//  MyPromise
//
//  Created by Sam Mahdad on 4/27/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit

class DailyPromise:Promise {
    var daysOfPromise: [Bool]?
    
    init(titleInput: String?, descriptionInput: String?, promiseDays: [Bool]?) {
        super.init(titleInput: titleInput, descriptionInput: descriptionInput)
        daysOfPromise = promiseDays
    }
    
    func completeDayPromise() -> Bool {
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let myComponents = myCalendar.components(.Weekday, fromDate: NSDate())
        //For 0 index, where 0 is Sunday
        let weekDay = myComponents.weekday - 1
        
        if daysOfPromise![weekDay] {
            super.statitistics?.completedTodaysPromise()
            return true
        }
        return false
    }
    
    func alreadyCompleted() -> Bool {
        return super.statitistics!.doneForToday()
    }
    
    func getDayStats() -> String {
        return String(super.statitistics!.daysCompleted!) + " / " + String(super.statitistics!.getTotalDays())
    }
    
    func daysAwayFromToday() -> Int {
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let myComponents = myCalendar.components(.Weekday, fromDate: NSDate())
        //For 0 index, where 0 is Sunday
        let weekDay = myComponents.weekday - 1
        
        var i = 0
//        print("For loop")
        for i in 0...6 {
            print(i)
            if daysOfPromise![(i + weekDay) % 7] {
                return i
            }
        }
        return i
    }
    
    func getDaysOfPromise() -> String {
        var final = ""
        var broke = false
        
        if daysOfPromise![0] {
            final += "Sunday  "
        }
        if daysOfPromise![1] {
            final += "Monday  "
        }
        if daysOfPromise![2] {
            final += "Tuesday  "
        }
        if daysOfPromise![3] {
            final += "Wednesday  "
        }
        
        if daysOfPromise![4] {
            final += "Thursday  "
        }
        if daysOfPromise![5] {
            final += "Friday  "
        }
        if daysOfPromise![6] {
            final += "Saturday  "
        }
        
        return final
    }
}
