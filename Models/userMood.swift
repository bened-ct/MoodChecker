//
//  userMood.swift
//  MoodChecker
//
//  Created by Benedict Velasco on 11/02/22.
//

import Foundation

class userMood : Codable {
    
    var mood = Mood()
    var calendar: [String:Int] = ["Monday": 0, "Tuesday": 0, "Wednesday": 0, "Thursday": 0, "Friday": 0, "Saturday": 0, "Sunday": 0]
    
    // Modify the calendar array if its still empty
    func addMood(day: String, mood: Int) -> [String:Int] {
        
        calendar[day] = mood

        return calendar
    }
}
