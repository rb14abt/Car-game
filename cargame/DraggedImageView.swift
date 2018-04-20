//
//  DraggedImageView.swift
//  cargame
//
//  Created by Roman Bidnyy on 19/04/2018.
//  Copyright © 2018 Roman Bidnyy. All rights reserved.
//

import UIKit

class DraggedImageView: UIImageView {

    //var myDelegate: subviewDelegate?
    var startLocation: CGPoint?
    var myDelegate: subviewDelegate?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //calculate offset
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        self.myDelegate?.changeSomething()
        self.center = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        //constrain movement into parent bound
       // let rect = self.bounds
       // self.center.x =
        
        //let rect = self.bounds
        //let halfx = rect.midX
        //self.center.x = self.superview?.bounds.size.width - halfx
        //self.center.x = MAX(self.superview?.bounds.size.width - halfx)
        
        //let halfy = rect.midY
        //self.center.y = MAX(self.superview?.bounds.size.height - halfy)
        
        
        
    }
    

}
