//
//  ViewController.swift
//  cargame
//
//  Created by Roman Bidnyy on 19/04/2018.
//  Copyright © 2018 Roman Bidnyy. All rights reserved.
//

import UIKit
protocol subviewDelegate{
   func changeSomething()
}


let W = UIScreen.main.bounds.width
let H = UIScreen.main.bounds.height
class ViewController: UIViewController, subviewDelegate {

    var dynamicAnimator: UIDynamicAnimator!
    var gravityBehaviour: UIGravityBehavior!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    var collisionBehaviour: UICollisionBehavior!
    
    @IBOutlet weak var highscore: UILabel!
    @IBOutlet weak var replay: UIButton!
    @IBAction func replay(replay sender: UIButton){
        finishView.removeFromSuperview()
        for (oneSubView) in self.othercarViews{
            oneSubView.removeFromSuperview()
        }
        
        viewDidLoad()
    }
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var usercar: DraggedImageView!
    
    var point = 0;
    var i = 0;
    var start = 20;
    @objc var startTimer = Timer()
    let finishView = UIImageView(image: nil)
    var othercarViews:[UIImageView] = []
    var pointArray:[UIImageView] = []
    
    let Array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    
    func changeSomething(){
        
        collisionBehaviour.removeAllBoundaries()
        collisionBehaviour.addBoundary(withIdentifier: "usercar" as NSCopying, for: UIBezierPath(rect: usercar.frame))
        
        for (oneSubView) in self.othercarViews {
            
            if(usercar.frame.intersects(oneSubView.frame)){
                self.i = self.i - 1
                self.score.text = String(self.i)
                
                
            
        }
    }
    }
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //point = 0;
        
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
        
        
     background.image = UIImage.animatedImage(with: imageArray, duration: 3)
     self.background.frame = CGRect(x: 0, y: 0, width: W, height: H)
        
    usercar.myDelegate = self
        
   // self.usercar.frame = CGRect(x: W * 0.5 , y: H * 0.15 , width: , height: 70)
    
        replay.isHidden = true
        highscore.isHidden = true
        
     dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
     dynamicItemBehaviour = UIDynamicItemBehavior(items:[])
     collisionBehaviour = UICollisionBehavior(items:[])
     self.score.text = String(self.point)
     //self.
        for index in 0...19{
            
            let Delay = Double(self.Array[index])

            let when = DispatchTime.now() + Delay
            
            DispatchQueue.main.asyncAfter(deadline: when) {
            
                let othercar = arc4random_uniform(10)
                
                let othercarView = UIImageView (image: nil)
                
                switch othercar{
                    
                case 1: othercarView.image = UIImage(named: "car1.png")
                    
                case 2: othercarView.image = UIImage(named: "car2.png")
                    
                case 3: othercarView.image = UIImage(named: "car3.png")
                    
                case 4: othercarView.image = UIImage(named: "car4.png")
                    
                case 5: othercarView.image = UIImage(named: "car5.png")
                    
                default : othercarView.image = UIImage(named: "car6.png")
                    
                //default: barrierView.image = UIImage(named: "lambo.png")
                    
                }
                
                let RandomXVar = Int(arc4random_uniform(250) + 50)
                
                othercarView.frame = CGRect(x: RandomXVar, y: 0, width: 40, height:60 )
                
                self.view.addSubview(othercarView)
                
                self.view.bringSubview(toFront: othercarView)
                
                
                
                
                
                self.dynamicItemBehaviour.addItem(othercarView)
                
                self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: 0, y: 250), for: othercarView)
                
                
                self.collisionBehaviour.addItem(othercarView)
                
                self.pointArray.append((othercarView))
                
                //if self.usercar.frame.intersects(othercarView.frame){
                   // self.i = self.i + 1

                
                //self.score.text = String(self.i)
                
                               // }
                //self.point += 1
                
                
                
                self.collisionBehaviour.translatesReferenceBoundsIntoBoundary = false
                
                self.othercarViews.append(othercarView)
            }
        }
        
    
        dynamicAnimator.addBehavior(dynamicItemBehaviour)
        
        
        
        self.collisionBehaviour.translatesReferenceBoundsIntoBoundary = false
        
        
        
        dynamicAnimator.addBehavior(collisionBehaviour)
        
        finishView.image = UIImage(named: "game_over.jpg")
        
        self.finishView.frame = CGRect(x: 0, y: 0, width: W, height: H)
        
        
        
        let currentwhen = DispatchTime.now() + 20
        
        DispatchQueue.main.asyncAfter(deadline: currentwhen){
            
            self.view.addSubview(self.finishView)
            
            self.view.addSubview(self.replay)
            
            self.highscore.text = "Highscore: " + self.i.description
            self.highscore.isHidden = false
            self.highscore.frame = CGRect(x: W * 0.1, y: H * 0.65 , width: W * 0.8, height: H * 0.1)
            self.replay.isHidden = false
            self.replay.frame = CGRect(x: W * 0.35, y: H * 0.72 , width: W * 0.3, height: H * 0.2)
            self.view.bringSubview(toFront: self.highscore)
            self.usercar.frame = CGRect(x: W * 0.4, y: H * 0.77 , width: W * 0.2, height: H * 0.33)

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

