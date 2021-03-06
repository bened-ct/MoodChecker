//
//  MoodCheckViewController.swift
//  MoodChecker
//
//  Created by Benedict Velasco on 2/02/22.
//

import UIKit

class MoodCheckViewController: UIViewController, StoryboardInitializable {
    
    var moodCall = userMood()
    var recArray = [String: Int]()
    var message = "Select a mood"
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var fineButton: UIButton!
    @IBOutlet weak var mildButton: UIButton!
    @IBOutlet weak var tiredButton: UIButton!
    @IBOutlet weak var stressButton: UIButton!
    @IBOutlet weak var veryButton: UIButton!
    @IBOutlet weak var extremeButton: UIButton!
    @IBOutlet weak var moodDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load data saved from last session and place inside recArray
        recArray = (defaults.object(forKey: "moodKey") as? [String:Int])!
        
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
    
    @IBAction func moodPressed(_ sender: UIButton) {
        // Any mood buttons are pressed..
        
        // The message label will display its Title
        let titleString = sender.accessibilityLabel
        message = titleString!
        showText()
        
        // And its respective tag is saved by calling the storeMood() method
        let data: Int! = sender.tag
        storeMood(value: data)
        
    }
    
    
    @IBAction func resultPressed(_ sender: Any) {
        
        let graphView = GraphViewController.storyboardInstantiate()
        
        self.present(graphView, animated: true, completion: nil)
        
    }
    
    // Changes the text based on button pressed
    func showText(){
        
        moodDisplay.text = message
    }
    
    // Save the mood's button tag AND weekday it was pressed to respective array
    func storeMood(value: Int){
        
        // Record the weekday that the mood button was pressed and store it in weekday variable
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "EEEE"
        let weekday: String = df.string(from: date)
        
        // Add weekday and mood-tag of button pressed to an object
        
        //Check if there is already data saved and save to that array instead
        if UserDefaults.standard.object(forKey: "moodKey") != nil {
            
            print("Data saved in old array")
            
            let fileName = Bundle.main.bundleIdentifier!
            let library = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
            let preferences = library.appendingPathComponent("Preferences")
            let userDefaultsPlistURL = preferences.appendingPathComponent(fileName).appendingPathExtension("plist")
            
            print("Library directory:", userDefaultsPlistURL.path)
            print("Preferences directory:", userDefaultsPlistURL.path)
            print("UserDefaults plist file:", userDefaultsPlistURL.path)
            
            recArray[weekday] = value
            defaults.set(recArray, forKey: "moodKey")
            
        } else {
            // else create a new dictionary array and populate
            let newMood = Mood()
            newMood.date = weekday
            newMood.mood = value
            
            let saveData = moodCall.addMood(day: newMood.date!, mood: newMood.mood!)
            
            defaults.set(saveData, forKey: "moodKey") //name new array moodKey
            
            print("Data saved in new array")
        }
    }
    
}

