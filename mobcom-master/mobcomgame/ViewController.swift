//
//  ViewController.swift
//  mobcomgame
//
//  Created by jo15abb on 31/03/2018.
//  Copyright © 2018 jo15abb. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var highScoreNumber: UILabel!
    @IBOutlet weak var highScore: UILabel!

  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startButton.layer.cornerRadius = 5.0
        
        
        
        }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Used instead of load because load only gets called on first time app is opened
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        
        if(value == nil){
            highScoreNumber.text = "0"
            
        
        }else{
            highScoreNumber.text = value
            
        }
    }
   
    

   
    



        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

