//
//  ViewController.swift
//  cargame
//
//  Created by Roman Bidnyy on 19/04/2018.
//  Copyright © 2018 Roman Bidnyy. All rights reserved.
//

import UIKit
let W = UIScreen.main.bounds.width
let H = UIScreen.main.bounds.height
class ViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

