//
//  draggableCar.swift
//  mobcomgame
//
//  Created by jo15abb on 31/03/2018.
//  Copyright © 2018 jo15abb. All rights reserved.
//

import UIKit



class draggableCar: UIImageView {
    
    var myDelegate: subViewDelegate?

    var startLocation: CGPoint?
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Record touch's beginning location
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        //When touch moves, find coordinates of current touch, and then set ceter position of image
        self.center = CGPoint(x:self.center.x+dx, y:self.center.y+dy)
        
        self.myDelegate?.changeSomething()
    }
}
