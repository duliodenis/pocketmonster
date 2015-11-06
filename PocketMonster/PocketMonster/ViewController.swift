//
//  ViewController.swift
//  PocketMonster
//
//  Created by Dulio Denis on 11/5/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageArray = [UIImage]()
        for var x = 1; x <= 4; x++ {
            let img = UIImage(named: "idle\(x).png")
            imageArray.append(img!)
        }
        
        monsterImage.animationImages = imageArray
        monsterImage.animationDuration = 0.8
        monsterImage.animationRepeatCount = 0
        monsterImage.startAnimating()
    }

}

