//
//  GameViewController.swift
//  mobcomgame
//
//  Created by jo15abb on 10/04/2018.
//  Copyright © 2018 jo15abb. All rights reserved.
//

import UIKit
import AVFoundation

protocol subviewDelegate {
    func  changeSomething()
}

class GameViewController: UIViewController, subviewDelegate, AVAudioPlayerDelegate, UICollisionBehaviorDelegate {
    
    func changeSomething() {
        collisionBehaviour.removeAllBoundaries()
        
        self.collisionBehaviour.addBoundary(withIdentifier: "barrier" as
            NSCopying, for: UIBezierPath(rect: self.car0view.frame))
        
        for thisCar in scoreArray{
            if(car0view.frame.intersects(thisCar.frame)){
                newScore = newScore - 2
                self.scoreNum.text = String (self.newScore)
            }
        }
    }
    
    @IBOutlet weak var scoreNum: UILabel!
    
    @IBOutlet weak var timeRemaining: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var roadImage: UIImageView!
    
    @IBOutlet weak var car0view: draggableCar!
    
    @IBOutlet weak var timer: UILabel!
    
    
    
    var startInt = 3
    var startTimer = Timer()
    
    var timerInt = 20
    var gameTimer = Timer()
    
    var newScore = 0
    
    //vars
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    
    var collisionBehaviour: UICollisionBehavior!
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var scoreArray: [UIImageView] = []
    
    var recordData:String!
    
    
    
    
    //for Array
    
    let forArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collisionBehaviour = UICollisionBehavior(items: [])
        collisionBehaviour.collisionDelegate = self

        
        car0view.myDelegate = self
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        recordData = value
        
        
        //Road moving animation
        var imageArray: [UIImage]!
        
        imageArray = [UIImage(named: "road1.png")!,
                      UIImage(named: "road2.png")!,
                      UIImage(named: "road3.png")!,
                      UIImage(named: "road4.png")!,
                      UIImage(named: "road5.png")!,
                      UIImage(named: "road6.png")!,
                      UIImage(named: "road7.png")!,
                      UIImage(named: "road8.png")!,
                      UIImage(named: "road9.png")!,
                      UIImage(named: "road10.png")!,
                      UIImage(named: "road11.png")!,
                      UIImage(named: "road12.png")!,
                      UIImage(named: "road13.png")!,
                      UIImage(named: "road14.png")!,
                      UIImage(named: "road15.png")!,
                      UIImage(named: "road16.png")!,
                      UIImage(named: "road17.png")!,
                      UIImage(named: "road18.png")!,
                      UIImage(named: "road19.png")!,
                      UIImage(named: "road20.png")!]
        
        roadImage.image = UIImage.animatedImage(with: imageArray, duration: 1)
        
        
        
        startInt = 3
        timer.text = String(startInt)
        car0view.isUserInteractionEnabled = false
        
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.gameStartTimer), userInfo: nil, repeats: true)
        
        
        var timerInt = 20
        timeRemaining.text = String(timerInt)
        playSound()

        
        
        
    }
    
    
    func gameStartTimer() {
        
        startInt -= 1
        timer.text = String(startInt)
        
        if startInt == 0 {
            startTimer.invalidate()
            timer.isHidden = true
            car0view.isUserInteractionEnabled = true
            
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.gameRemainingTime), userInfo: nil, repeats: true)
            randCar()
        }
    }
    
    
    func gameRemainingTime(){
        
        timerInt -= 1
        timeRemaining.text = String(timerInt)
        
        if timerInt == 0{
            gameTimer.invalidate()
            
            
            if recordData == nil{
                
                let savedString = scoreNum.text
                let userDefaults = Foundation.UserDefaults.standard
                userDefaults.set(savedString, forKey: "Key")
                
            }else{
                
                let score:Int? = Int(scoreNum.text!)
                let record:Int? = Int(recordData)
                
                if score! > record! {
                    
                    let savedString = scoreNum.text
                    let userDefaults = Foundation.UserDefaults.standard
                    userDefaults.set(savedString, forKey: "Record")
                }
                
                
            }
            
          
            
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameViewController.endGame), userInfo: nil, repeats: false)
            
        }
    }
    
    
    func endGame(){
        
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "endGame") as! endGameController
        
        vc.scoreData = scoreNum.text
        
        self.present(vc, animated: false, completion: nil)
    }
    
    
    func randCar(){
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehaviour = UIDynamicItemBehavior(items: [])
        
        
        
        for i in  0...37{
            
            let delayTime = Double(self.forArray[i])
            let randomtimer = DispatchTime.now() + delayTime
            
            let random = arc4random_uniform(201) + 40
            
            
            DispatchQueue.main.asyncAfter(deadline: randomtimer){
                
                let cars = UIImageView(image: nil)
                let randomCar = Int(arc4random_uniform(6))
                
                let randomSpeed = Int(arc4random_uniform(50) + 300)
                
                //sets car image to one of 6 images based on value of randomCar
                switch randomCar{
                case 1: cars.image = UIImage(named: "car1.png")
                case 2: cars.image = UIImage(named: "car2.png")
                case 3: cars.image = UIImage(named: "car3.png")
                case 4: cars.image = UIImage(named: "car4.png")
                case 5: cars.image = UIImage(named: "car5.png")
                case 6: cars.image = UIImage(named: "car6.png")
                    
                default: cars.image = UIImage(named: "car1.png")
                }
                
                self.scoreNum.text = String(self.newScore)
                self.newScore = self.newScore + 5
                
                cars.frame = CGRect(x: Int(random), y:0, width: 40, height:60)
                self.view.addSubview(cars)
                
                self.dynamicItemBehaviour.addItem(cars)
                self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x:0, y:randomSpeed), for: cars)
                self.collisionBehaviour.addItem(cars)
                
                
            }
            dynamicAnimator.addBehavior(dynamicItemBehaviour)
            dynamicAnimator.addBehavior(collisionBehaviour)
        }
    }
    
//    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
//        self.newScore -= 1
//        print("Collision")
//        
////        let explosionPlayer = Bundle.main.path(forResource: "explosion", ofType: "mp3")
////        
////        do{
////            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: explosionPlayer!) as URL)
////        }
////        catch{
////            //ERROR
////        }
////        
////        player.play()
//
//        
//    }
    
    func playSound() {
        let audioPlayer = Bundle.main.path(forResource: "carstart3", ofType: "mp3")
        
        do{
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPlayer!) as URL)
        }
        catch{
            //ERROR
        }
        
        player.play()

        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
