//
//  MoodCheckViewController.swift
//  MoodChecker
//
//  Created by Benedict Velasco on 2/02/22.
//

import UIKit
import Foundation

class MoodCheckViewController: UIViewController {
    
    var message = "Select a mood" // message displayed on page that gets changed
    let weekday = Date.getWeekday() // extracts weekday
    var weekly: [String: Int] = ["Monday": 0, "Tuesday": 1, "Wednesday": 1, "Thursday": 3, "Friday": 0, "Saturday": 0, "Sunday": 0] // array that stores data and gets saved in User Default
    
    @IBOutlet weak var fineButton: UIButton!
    @IBOutlet weak var mildButton: UIButton!
    @IBOutlet weak var tiredButton: UIButton!
    @IBOutlet weak var stressButton: UIButton!
    @IBOutlet weak var veryButton: UIButton!
    @IBOutlet weak var extremeButton: UIButton!
    @IBOutlet weak var moodDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showText()
        
        // Assigns string messages to respective buttons
        fineButton.accessibilityLabel = "Fine"
        mildButton.accessibilityLabel = "Mild"
        tiredButton.accessibilityLabel = "Tired"
        stressButton.accessibilityLabel = "Stress"
        veryButton.accessibilityLabel = "Very Stressed"
        extremeButton.accessibilityLabel = "Extremely Stressed"
        
        // Assigns value tags to respective buttons
        fineButton.tag = 0
        mildButton.tag = 1
        tiredButton.tag = 2
        stressButton.tag = 3
        veryButton.tag = 4
        extremeButton.tag = 5
        
    }
    
    // Changes the text based on button pressed
    func showText(){
        moodDisplay.text = message
    }
    
    // Save the mood's button tag to respective weekday in weekly array
    func storeMood(value: Int){
        weekly[weekday] = value
        
        // User Defaults used to record the mood pressed for the corresponding weekday
        let defaults = UserDefaults.standard
        defaults.set(weekly, forKey: "ArrayKey")
        defaults.synchronize()
    }

    @IBAction func moodPressed(_ sender: UIButton) {
        let titleString = sender.accessibilityLabel
        
        message = titleString!
        showText() //
        
        let data = sender.tag
        storeMood(value: data)
        
        // Code used to figure out if data has been saved - comment out to check
//        print(data) // display tag of button
        
//        print(weekday) // display weekday
        
//        for (key, value) in weekly {
//            print(key, value) // prints array to show that data has been saved
//        }
        
    }
    
}

// Used to extract the weekday of present day
extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.string(from: Date())

    }
    
 static func getDayNameBy(stringDate: String) -> String
    {
        let df  = DateFormatter()
        df.dateFormat = "YYYY-MM-dd"
        let date = df.date(from: stringDate)!
        df.dateFormat = "EEEE"
        return df.string(from: date);
    }
    
    static func getWeekday()-> String {
        let weekday : String
        
        weekday = Date.getDayNameBy(stringDate: Date.getCurrentDate())
        
        return weekday
    }
}
