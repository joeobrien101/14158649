//
//  ViewController.swift
//  mobcomgame
//
//  Created by jo15abb on 31/03/2018.
//  Copyright © 2018 jo15abb. All rights reserved.
//

import UIKit

protocol subViewDelegate {
    func changeSomething()
}

class ViewController: UIViewController, subViewDelegate {
    
    
    func changeSomething() {
        collisionBehaviour.removeAllBoundaries()
        self.collisionBehaviour.addBoundary(withIdentifier: "barrier" as
            NSCopying, for: UIBezierPath(rect: self.car0view.frame))
    }

    
    @IBOutlet weak var car0view: draggableCar!
  
    
    @IBOutlet weak var roadImage: UIImageView!
    
    //vars
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    
    var collisionBehaviour: UICollisionBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Assign viewController as the delegate for car0 imageView
        car0view.myDelegate = self
        
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
                      UIImage(named: "road17.png")!]
        
        roadImage.image = UIImage.animatedImage(with: imageArray, duration: 1)

        // creating obstacle cars
        
        
        
        carArray = [UIImage(named: "car1.png")!,
        UIImage(named: "car2.png")!,
        UIImage(named: "car3.png")!,
        UIImage(named: "car4.png")!,
        UIImage(named: "car5.png")!,
        UIImage(named: "car6.png")!]
        
        
        
        //Creating new UIImageViews
        let car1View = UIImageView(image: nil)
        let car2View = UIImageView(image: nil)
        let car3View = UIImageView(image: nil)
        let car4View = UIImageView(image: nil)
        let car5View = UIImageView(image: nil)
        let car6View = UIImageView(image: nil)
        
        //Assigning images to images views
        car1View.image = UIImage(named: "car1.png")
        car2View.image = UIImage(named: "car2.png")
        car3View.image = UIImage(named: "car3.png")
        car4View.image = UIImage(named: "car4.png")
        car5View.image = UIImage(named: "car5.png")
        car6View.image = UIImage(named: "car6.png")
        
        //Assigning size and position of image views
        car1View.frame = CGRect(x:180, y: 0, width: 30, height: 50)
        car2View.frame = CGRect(x:100, y: 0, width: 30, height: 50)
        car3View.frame = CGRect(x:100, y: 0, width: 30, height: 50)
        car4View.frame = CGRect(x:100, y: 0, width: 30, height: 50)
        car5View.frame = CGRect(x:200, y: 0, width: 30, height: 50)
        car6View.frame = CGRect(x:100, y: 0, width: 30, height: 50)
        
        //array
        
       
            
        
        
        
    
        
        
        
        
        
       
        
        
        
        //setting timer for other cars to appear
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            self.view.addSubview(car1View)
            
            self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
            
            self.dynamicItemBehaviour = UIDynamicItemBehavior(items: [car1View])
            self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x:0, y:100), for: car1View)
            self.dynamicAnimator.addBehavior(self.dynamicItemBehaviour)
            
            //obstacle car collisions
            self.collisionBehaviour = UICollisionBehavior(items: [car1View])
            self.dynamicAnimator.addBehavior(self.collisionBehaviour)
            
            //car0 frame collison
            self.collisionBehaviour.addBoundary(withIdentifier: "barrier" as
                NSCopying, for: UIBezierPath(rect: self.car0view.frame))
        }
        
        


        //how to select random car from list - https://stackoverflow.com/questions/46598047/how-to-select-random-images-from-array-using-uiimageview
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

