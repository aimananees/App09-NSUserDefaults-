//
//  ViewController.swift
//  StoringScores
//
//  Created by Aiman Abdullah Anees on 28/05/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var Player: UILabel!
    @IBOutlet var Score: UILabel!
    @IBOutlet var HighScore: UILabel!
    @IBOutlet var Leader: UILabel!
    
    @IBOutlet var TextField: UITextField!
    var CurrentPlayer = ""
    var ScoreTotal = 0
    var HighScoreTotal = 0
    var LeaderName = ""
    
    
    
    let UserDefaults = NSUserDefaults.standardUserDefaults()
    var users = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if UserDefaults.valueForKey("highScore") != nil && UserDefaults.valueForKey("leader") != nil {
        HighScoreTotal = UserDefaults.valueForKey("highScore") as! Int
        LeaderName = UserDefaults.valueForKey("leader") as! String
        
        HighScore.text = "\(HighScoreTotal)"
        Leader.text = LeaderName
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func AddPlayer(sender: UIButton) {
        CurrentPlayer = TextField.text!
        Player.text = CurrentPlayer
        users.append(CurrentPlayer)
        UserDefaults.setObject(users, forKey: "usernames")
        print(users)
        
        
    }
    
    
    @IBAction func UpdateScore(sender: UIButton) {
        
        ScoreTotal = ScoreTotal + 10
        Score.text = "\(ScoreTotal)"
        
        if (ScoreTotal>HighScoreTotal)
        {
            HighScoreTotal = ScoreTotal
            HighScore.text = "\(HighScoreTotal)"
            Leader.text = CurrentPlayer
            LeaderName = CurrentPlayer
            
            UserDefaults.setValue(HighScoreTotal, forKey: "highScore")
            UserDefaults.setValue(LeaderName, forKey: "leader")
            
        }
        
    }
    
    
    
    @IBAction func Reset(sender: UIButton) {
        
        ScoreTotal = 0
        Score.text = "0"
        Player.text = "Enter username"
        TextField.text = ""
        
    }








}
