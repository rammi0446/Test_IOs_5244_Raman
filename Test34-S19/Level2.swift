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
        
        print("Node A: \(nodeA)")
        print("Node B: \(nodeB)")
        
        
        if(nodeA!.name == "cat" && nodeB!.name == "exit")
        {
            
            print("player touch the exit")
            nodeA!.physicsBody?.isDynamic = false;
            //Game win
            let messegeLabel = SKLabelNode(text: "You Win")
            messegeLabel.fontColor = UIColor.yellow
            messegeLabel.fontSize = 80
            messegeLabel.position.x = self.size.width/2
            messegeLabel.position.y = self.size.height/2
            addChild(messegeLabel)
          
        }
        if(nodeA!.name == "exit" && nodeB!.name == "cat")
        {
            
            print("player touch the exit")
            nodeB!.physicsBody?.isDynamic = false;
            //Game win
            let messegeLabel = SKLabelNode(text: "You Win")
            messegeLabel.fontColor = UIColor.yellow
            messegeLabel.fontSize = 80
            messegeLabel.position.x = self.size.width/2
            messegeLabel.position.y = self.size.height/2
            addChild(messegeLabel)
           
            
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
        cat.physicsBody?.categoryBitMask = 8
        cat.physicsBody?.collisionBitMask = 3
        cat.name = "cat"
        
     
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
