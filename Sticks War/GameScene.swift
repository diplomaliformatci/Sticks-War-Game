//
//  GameScene.swift
//  Sticks War
//
//  Created by Can KINCAL on 23/02/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import SpriteKit
import GameplayKit
import CCDJoystick
class GameScene: SKScene {
    
    
    
    var Stickman1: Stickman!
    var Stickman2: Stickman!
    
    var downArrow: SKSpriteNode!
    var circle: SKSpriteNode!
    var upArrow: SKSpriteNode!
    var leftArrow: SKSpriteNode!
    var rightArrow: SKSpriteNode!
    var ground: SKSpriteNode!
    var triangle: SKSpriteNode!
    var rectangle: SKSpriteNode!
    var Target: String = ""
    var joystick: AnalogJoystick!
    var joyBool : Bool = true
    var Stickmans: Dictionary<Stickman,Int>!
    var floor: SKShapeNode = SKShapeNode(rect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.height / 3))
    
    override func didMove(to view: SKView) {
        
        joystick = AnalogJoystick(diameters: (100,50) , colors: (UIColor.darkGray , UIColor.yellow))
        joystick.zPosition = 100
        joystick.isHidden = true
        joystickHandler()
        self.backgroundColor = .white
        floor.fillColor = .darkGray
        addChild(floor)
        self.ground = SKSpriteNode(imageNamed: "Rectangle 2")
        self.Stickman1 = Stickman()
        self.Stickman2 = Stickman()
        addChild(Stickman1)
        
        addChild(joystick)
        Stickman2.position = CGPoint(x: 250 , y: 250)
        
        addChild(Stickman2)
        Stickmans = [:]
        Stickmans[Stickman1] = Stickman1.health
        Stickmans[Stickman2] = Stickman2.health
        
        self.triangle = SKSpriteNode(imageNamed: "Triangle")
        self.downArrow = SKSpriteNode(imageNamed: "DownArrow")
        self.downArrow.zPosition = 5
        self.upArrow = SKSpriteNode(imageNamed: "UpArrow")
        self.leftArrow = SKSpriteNode(imageNamed: "LeftArrow")
        self.rightArrow = SKSpriteNode(imageNamed: "RightArrow")
        self.rectangle  = SKSpriteNode(imageNamed: "Rectangle")
        self.circle = SKSpriteNode(imageNamed: "Circle")
        let displaySize: CGRect = UIScreen.main.bounds
        Stickman1.scale(to: CGSize(width: displaySize.width / 15 , height: displaySize.height / 15))
        Stickman2.scale(to: CGSize(width: displaySize.width / 15 , height: displaySize.height / 15))
        self.rectangle.position = CGPoint(x: displaySize.maxX - displaySize.maxX / 10 , y: displaySize.minY + displaySize.maxY / 10)
        self.triangle.position = CGPoint(x: rectangle.position.x - rectangle.size.width * 2 , y: rectangle.position.y)
        
        //ground.size = CGSize(width: displaySize.width, height: displaySize.height / 10)
        //ground.position = CGPoint(x: 0, y: 0)
        //ground.zPosition = 3
        //addChild(ground)
        let arrowSize = CGSize(width: displaySize.maxX/10, height: displaySize.maxY/5)
        let arrowPoint: CGPoint = CGPoint(x: displaySize.minX + arrowSize.width , y: displaySize.minY + arrowSize.height + 10)
        
        self.ground.scale(to: CGSize(width: UIScreen.main.bounds.maxX, height: upArrow.position.y + displaySize.height / 5))
        joystick.position = arrowPoint
        self.rectangle.scale(to: CGSize(width:displaySize.width/20, height: displaySize.height/15))
        self.triangle.scale(to: rectangle.size)
        self.circle.scale(to: rectangle.size)
        // print(displaySize.height ,"  " , displaySize.width)
        upArrow.scale(to: CGSize(width: arrowSize.width , height: arrowSize.height))
        upArrow.position = CGPoint(x: arrowPoint.x , y: arrowPoint.y )
        print(self.rightArrow.size)
        self.rightArrow.scale(to: arrowSize)
        self.rightArrow.position = CGPoint(x: (upArrow.position.x + upArrow.size.width / 2)  + 20, y: arrowPoint.y - displaySize.maxY / 10)
        leftArrow.scale(to: arrowSize)
        leftArrow.position = CGPoint(x: (upArrow.position.x - upArrow.size.width / 2 ) - 20, y: arrowPoint.y - displaySize.maxY / 10)
        
        Stickman1.position = CGPoint(x: 15 , y: displaySize.height / 4 + Stickman1.size.height + 10)
        //addChild(downArrow)
        Stickman2.position = CGPoint(x: 250 , y: displaySize.height / 4 + Stickman1.size.height + 10)
        
        
        
        
        
        self.circle.position = CGPoint(x: self.triangle.position.x - triangle.size.width * 2 , y: rectangle.position.y)
        addChild(circle)
        addChild(triangle)
        addChild(upArrow)
        addChild(rightArrow)
        addChild(leftArrow)
        addChild(rectangle)
        print(arrowPoint)
        print(rightArrow.position)
        print(rectangle.position)
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            print(touch.location(in: self))
            let location = touch.location(in: self)
            
            if rectangle.contains(location) {
                print("Rectangle Pressed")
                action(with: Stickman1.atackwithNumber1)
                Target = "Atack"
            }
                
            else if leftArrow.contains(location) {
                print("Left Arrow Pressed")
                action(with: Stickman1.walkingLeftStickman)
                Target = "Move Left"
            }
                
                
            else if rightArrow.contains(location) {
                print("Right Arrow Pressed")
                action(with: Stickman1.walkingRightStickman)
                Target = "Move Right"
            }
                
            else if triangle.contains(location) {
                print("Triangle Pressed")
                let oldSize = Stickman1.size
                
                //Stickman1.scale(to: CGSize(width: Stickman1.size.width * 5, height: Stickman1.size.height * 5))
                
                action(with: Stickman1.greenCombo)
                
                // Stickman1.scale(to: oldSize)
                
                
                Target = "Atack"
            }
            else if circle.contains(location) {
                print("Circle Pressed")
                action(with: Stickman1.atackwithNumber2)
                Target = "Atack"
            }
            else {
                return
            }
            
            
            
        }
        
    }
    
    func action(with texture: [SKTexture]) {
        let run  = SKAction.animate(with: texture, timePerFrame: 0.05, resize: true, restore: false)
        Stickman1.run(SKAction.repeatForever(SKAction.sequence([run , SKAction.wait(forDuration: 0.001)])  ), withKey: "run")
        Stickman1.Action = true
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        Stickman1.Action = false
        Stickman1.removeAction(forKey: "run")
        action(with: [Stickman1.StickmanImage])
        Stickman1.Action = false
        print("Action Closed")
    }
    override func update(_ currentTime: TimeInterval) {
        
        
        for stickman1 in Stickmans.keys {
            for stickman2 in Stickmans.keys {
                if stickman1 == stickman2 {
                    break
                }
                
                if stickman1.contains(stickman2.position) {
                    if stickman1.Attack == true {
                        stickman2.health -= 10
                        action(with: stickman2.damaged)
                    }
                    else if Stickman2.Attack == true {
                        stickman1.health -= 10
                        action(with: stickman1.damaged)
                    } // not compeleted code yet controlling nothing
                    
                }
                
            }
        }
        
        
        //       print(jData.velocity)
        //     print("I am Here in the tracking Hangler")
        //print(jData.description)
        //        self.Stickman1.Action = true
        
        
        for stickman in Stickmans.keys {
            
            if stickman.Action {
                switch Target {
                case "Atack":
                    stickman.Attack = true
                case "Move Left":
                    Stickman1.position.x -= 3
                case "Move Right":
                    Stickman1.position.x += 3
                default:
                    break
                    
                }
            }
            
            
            
            
        }
    }
    
    //    func didBegin(_ contact: SKPhysicsContact) {
    //
    //        var firstBody = SKPhysicsBody()
    //        var secondBody = SKPhysicsBody()
    //
    //        if contact.bodyA.node?.name == "Stickman1" {
    //            firstBody = contact.bodyA
    //            secondBody = contact.bodyB
    //        }
    //
    //        if firstBody.node?.name == "Stickman1" && secondBody.node?.name == "Stickman2" {
    //            action(with: Stickman1.damaged)
    //        }
    //
    //    }
    
    func joystickHandler() {
        self.joystick.trackingHandler = { jData in
            print("I am here")
            if jData.velocity.x > 0 {
                print("Velocity > 0")
                self.joyBool = true
                self.Target = "Move Right"
                self.Stickman1.Action = true
            }
            else if jData.velocity.x < 0 {
                print("Velocity < 0 ")
                self.Target = "Move Left"
                self.Stickman1.Action = true
            } else {
                self.Target = ""
            }
        }
    }
    //
    
    
    
}





