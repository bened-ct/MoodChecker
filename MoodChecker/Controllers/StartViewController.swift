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
        
        let second = MoodCheckViewController.storyboardInstantiate()
        
        self.present(second, animated: true, completion: nil)
    }
    
    @IBAction func resultPressed(_ sender: Any) {
        
        let third = GraphViewController.storyboardInstantiate()
        
        self.present(third, animated: true, completion: nil)
        
    }
    
}

