//
//  Stickman.swift
//  Sticks War
//
//  Created by Can KINCAL on 24/02/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import SpriteKit

class Stickman: SKSpriteNode {
    var health = 100
    var damage = 10
    var Attack: Bool!
    var StickmanImage: SKTexture!
    var StickmanPosition: CGPoint!
    var walkingRightStickman: [SKTexture]!
    var walkingLeftStickman: [SKTexture]!
    var atackwithNumber1 : [SKTexture]!
    var atackwithNumber2 : [SKTexture]!
    var damaged: [SKTexture]!
    var greenCombo: [SKTexture]!
    var Action: Bool = false
    var StartTexture: SKTexture = SKTexture(imageNamed: "Stand")
    
    func walk() {
           self.run(SKAction.repeatForever(SKAction.animate(with: self.walkingRightStickman, timePerFrame: 0.05, resize: true, restore: true)))
       
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init () {
        super.init(texture: StartTexture , color: .clear , size: StartTexture.size())
        self.StickmanImage = SKTexture(imageNamed: "Stand")
        self.Attack = false
        StickmanPosition = CGPoint(x: 0, y: 0)
        var walkRightFrames = [SKTexture]()
        var walkLeftFrames = [SKTexture]()
        
        var atackNumber1Frames = [SKTexture]()
        var atackNumber2Frames = [SKTexture]()
        var greenCombo = [SKTexture]()
        var damaged = [SKTexture]()
        for i in 1...14 {
           let frameName = "Run\(i)"
            walkRightFrames.append(SKTexture(imageNamed: frameName))
        }
        
        for i in 1...8 {
            let frameName = "MoveLeft\(i)"
            walkLeftFrames.append(SKTexture(imageNamed: frameName))
            
            
            
        }
        
        
        for i in 1...5 {
            let frameName = "StandAtack\(i)"
            atackNumber1Frames.append(SKTexture(imageNamed: frameName))
            
        }
        
        for i in 2001...2111 {
            let frameName = "GreenCombo \(i)"
            greenCombo.append(SKTexture(imageNamed: frameName))
        }
        
        
        
        for i in 401...412 {
            let frameName = "StickmanAttack\(i)"
            atackNumber2Frames.append(SKTexture(imageNamed: frameName))
        }
        
        damaged.append(SKTexture(imageNamed: "DamagedStickman1"))
        self.damaged = damaged
        self.atackwithNumber2 = atackNumber2Frames
        self.greenCombo = greenCombo
        self.walkingLeftStickman = walkLeftFrames
        self.walkingRightStickman = walkRightFrames
        self.atackwithNumber1 = atackNumber1Frames
        
            }
    
}
