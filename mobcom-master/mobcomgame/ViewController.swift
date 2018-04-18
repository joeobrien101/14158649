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
        
        highScore.layer.cornerRadius = 5.0
        highScoreNumber.layer.cornerRadius = 5.0
        startButton.layer.cornerRadius = 5.0
        
        
        }
    
    
    
    
   
    

   
    



        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

