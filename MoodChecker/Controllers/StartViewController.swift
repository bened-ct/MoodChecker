//
//  StartViewController.swift
//  MoodChecker
//
//  Created by Benedict Velasco on 2/02/22.
//

import UIKit

class StartViewController: UIViewController, StoryboardInitializable {

    let main = UIStoryboard(name:"Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startPressed(_ sender: Any) {
        
//        let moodCheck = MoodCheckViewController.storyboardInstantiate()
//        navigationController?.pushViewController(moodCheck, animated: true)
        
        let second = main.instantiateViewController(withIdentifier: "secondVC")
        
        self.present(second, animated: true, completion: nil)
    }
    
    @IBAction func resultPressed(_ sender: Any) {
        
//        let graphView = GraphViewController.storyboardInstantiate()
//        navigationController?.pushViewController(graphView, animated: true)
        
        let third = main.instantiateViewController(withIdentifier: "thirdVC")
        
        self.present(third, animated: true, completion: nil)
        
    }
    
}

