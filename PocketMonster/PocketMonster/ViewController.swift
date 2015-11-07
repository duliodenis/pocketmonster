//
//  ViewController.swift
//  PocketMonster
//
//  Created by Dulio Denis on 11/5/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImage: MonsterImage!
    @IBOutlet weak var foodImage: DragImage!
    @IBOutlet weak var heartImage: DragImage!
    
    @IBOutlet weak var penalty1Image: UIImageView!
    @IBOutlet weak var penalty2Image: UIImageView!
    @IBOutlet weak var penalty3Image: UIImageView!
    
    let DIM_ALPHA: CGFloat  = 0.2
    let OPAQUE: CGFloat     = 1.0
    let MAX_PENALTIES       = 3
    var penalties           = 0
    
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImage.dropTarget = monsterImage
        heartImage.dropTarget = monsterImage
        
        penalty1Image.alpha = DIM_ALPHA
        penalty2Image.alpha = DIM_ALPHA
        penalty3Image.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
        
        startTimer()
    }
    
    func itemDroppedOnCharacter(notification: AnyObject) {
        print("Item dropped on target")
    }
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
    }
    
    func changeGameState() {
        penalties++
        
        if penalties == 1 {
            penalty1Image.alpha = OPAQUE
            penalty2Image.alpha = DIM_ALPHA
        } else if penalties == 2 {
            penalty2Image.alpha = OPAQUE
            penalty3Image.alpha = DIM_ALPHA
        } else if penalties == 3 {
            penalty3Image.alpha = OPAQUE
        } else {
            penalty1Image.alpha = DIM_ALPHA
            penalty2Image.alpha = DIM_ALPHA
            penalty3Image.alpha = DIM_ALPHA
        }
        
        if penalties >= MAX_PENALTIES {
            gameOver()
        }
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImage.playDeathAnimation()
    }
}

