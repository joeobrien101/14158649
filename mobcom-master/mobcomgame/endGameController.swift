//
//  endGameController.swift
//  mobcomgame
//
//  Created by jo15abb on 10/04/2018.
//  Copyright © 2018 jo15abb. All rights reserved.
//

import UIKit

class endGameController: UIViewController {
    
    @IBOutlet weak var replay: UIButton!
    
    @IBOutlet weak var backToMenu: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func restartGame(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gameView") as! GameViewController
        
        self.present(vc, animated: false, completion: nil)
    }
    
    

}
