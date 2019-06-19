//
//  GameScene.swift
//  Test34-S19
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 rabbit. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var nextLevelButton:SKLabelNode!
      let leg = SKSpriteNode(imageNamed: "leg")
        let hair1 =  SKSpriteNode(imageNamed: "hair")
    let hair2 =  SKSpriteNode(imageNamed: "hair")
    let hair3 =  SKSpriteNode(imageNamed: "hair")
    
    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        self.makeHairs()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
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
            let scene = SKScene(fileNamed:"Level2")
            if (scene == nil) {
                print("Error loading level")
                return
            }
            else {
                scene!.scaleMode = .aspectFill
                view?.presentScene(scene!)
            }
        }
        
    }
    
    
    func makeHairs() {
        // lets add some cats
        //cat = SKSpriteNode(imageNamed: "frame1")
        
        
        
        // generate a random (x,y) for the cat
        let randX = Int(CGFloat((UInt32(self.size.width-300))))
        let randY = Int(CGFloat((UInt32(self.size.height-300))))
        hair1.position = CGPoint(x:randX, y:randY)
        print("Where is cat? \(randX), \(randY)")
        addChild(hair1)
       
        
        let randX2 = Int(CGFloat((UInt32(self.size.width-400))))
        let randY2 = Int(CGFloat((UInt32(self.size.height-200))))
        hair2.position = CGPoint(x:randX2, y:randY2)
        print("Where is cat? \(randX2), \(randY2)")
        addChild(hair2)
     
        
        let randX3 = Int(CGFloat((UInt32(self.size.width-501))))
        let randY3 = Int(CGFloat((UInt32(self.size.height-204))))
        hair3.position = CGPoint(x:randX3, y:randY3)
        print("Where is cat? \(randX3), \(randY3)")
        addChild(hair3)
       
    }
}
