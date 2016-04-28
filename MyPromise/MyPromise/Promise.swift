//
//  Promise.swift
//  MyPromise
//
//  Created by Sam Mahdad on 4/27/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit

class Promise : NSObject {
    var title: String?
    var descriptionText: String?
    var completed: Bool
    var startDate: NSDate?
    var statitistics: Statistics?
    var dateCompleted: NSDate?
    
    init(titleInput: String?, descriptionInput: String?) {
        title = titleInput
        descriptionText = descriptionInput
        completed = false
        startDate = NSDate()
        statitistics = Statistics(date: startDate)
    }
    
    func getStats() -> String {
        return "Nothing"
    }
    
    func completePromise() -> Bool {
        if completed {
            return completed
        }
        completed = true
        dateCompleted = NSDate()
        statitistics!.completion(dateCompleted)
        return false
        
    }
    
    func alreadyCompletedPromise() -> Bool {
        return completed
    }
    
    
    
}
