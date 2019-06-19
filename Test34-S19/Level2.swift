//
//  GameScene.swift
//  Test34-S19
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 rabbit. All rights reserved.
//

import SpriteKit
import GameplayKit


class Level2: SKScene, SKPhysicsContactDelegate {
    
    var nextLevelButton:SKLabelNode!
   // var cat: SKSpriteNode!
    var movingRight:Bool = true
     let cat = SKSpriteNode(imageNamed: "frame1")
    
    override func didMove(to view: SKView) {
        print("Loaded level 2")
        // Required for SKPhysicsContactDelegate
        self.physicsWorld.contactDelegate = self
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        
          self.makeCats()
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
       
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if(nodeA!.name == "cat" && nodeB!.name == "rect1")
        {
            
            print("player touch the rect1")
      
        }
        if(nodeA!.name == "cat" && nodeB!.name == "rect2")
        {
            
            print("player touch the rect2")
     
        }
    
    }
    
   
    
    func makeCats() {
        // lets add some cats
       //cat = SKSpriteNode(imageNamed: "frame1")
        
       

        // generate a random (x,y) for the cat
        let randX = Int(CGFloat((UInt32(self.size.width-500))))
        let randY = Int(CGFloat((UInt32(self.size.height-200))))
        
        cat.position = CGPoint(x:randX, y:randY)
         print("Where is cat? \(randX), \(randY)")
        
        addChild(cat)
        let catBodyTexture = SKTexture(imageNamed: "frame1")
        cat.physicsBody = SKPhysicsBody(texture: catBodyTexture,
                                        size: catBodyTexture.size())
        cat.physicsBody?.isDynamic = true
        cat.physicsBody?.allowsRotation = false
      
        
  
       
        //move cats
        
        print("Where is cat? \(randX), \(randY)")
    }
        
    //time
     var timeOfLastUpdate:TimeInterval?
    override func update(_ currentTime: TimeInterval) {
        if(movingRight == true)
        {
            print("cat is moving")
            cat.position.x = cat.position.x + 5
            cat.physicsBody?.affectedByGravity = true
            if(cat.position.x >= self.frame.width - 100)
            {
                movingRight = false
            }
            
        }
        if(movingRight == false)
        {
            print("cat is moving")
            cat.position.x = cat.position.x - 5
            cat.physicsBody?.affectedByGravity = true
            if(cat.position.x <=  200)
            {
                movingRight = true
            }
            
        }
        
        if(cat.physicsBody?.collisionBitMask == 2)
        {
            print("collision with rect2")
        }
        // Called before each frame is rendered
       // if (timeOfLastUpdate == nil) {
            timeOfLastUpdate = currentTime
       // }
        // print a message every 3 seconds
       // var timePassed = (currentTime - timeOfLastUpdate!)
       // if (timePassed >= 1) {
        //print("HERE IS A MESSAGE!")
         //   timeOfLastUpdate = currentTime
            // make a cat
        
           
            
       // }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if (touch == nil) {
            return
        }
        
        let location = touch!.location(in:self)
        let node = self.atPoint(location)
        
        
        
        
        // MARK: Switch Levels
        
        if (node.name == "nextLevelButton") {
            let scene = SKScene(fileNamed:"Level3")
            if (scene == nil) {
                print("Error loading level")
                return
            }
            else {
                scene!.scaleMode = .aspectFill
                view?.presentScene(scene!)
            }
        }
        
        //move leemings
        
        
    }
    
    

   
}
