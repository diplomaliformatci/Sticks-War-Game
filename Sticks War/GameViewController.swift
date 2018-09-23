//
//  GameViewController.swift
//  Sticks War
//
//  Created by Can KINCAL on 23/02/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CCDJoystick

class GameViewController: UIViewController {
   
    let joystick: CCDJoystick = CCDJoystick()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.joystick.frame = CGRect(x: view.bounds.size.width - 100  , y: view.bounds.size.height - 100  , width: 100 , height: 100)
        self.joystick.backgroundColor = .black
        let scene = GameScene(size: CGSize(width: view.bounds.size.width , height: view.bounds.size.height))
        //let scene = GameScene(fileNamed: "FightScene"
        let skView = self.view as! SKView
        skView.addSubview(joystick)
        self.joystick.isHidden = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
