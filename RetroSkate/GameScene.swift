//
//  GameScene.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/11/16.
//  Copyright (c) 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let ASP_PIECES = 15
    let GROUND_SPEED: CGFloat = -8.5
    let GROUND_X_Reset: CGFloat = -150
    var moveGroundAction: SKAction!
    var moveGroundActionForever: SKAction!
    var asphaltPieces = [SKSpriteNode]()
    
    override func didMoveToView(view: SKView) {
        
        setupBackground()
        setupGround()
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        groundMovement()
    }
    
    func setupBackground() {
        let bg = SKSpriteNode(imageNamed: "bg1")
        bg.position = CGPointMake(517, 400)
        bg.zPosition = 3
        self.addChild(bg)
        
        let bg2 = SKSpriteNode(imageNamed: "bg2")
        bg2.position = CGPointMake(517, 450)
        bg2.zPosition = 2
        self.addChild(bg2)
        
        let bg3 = SKSpriteNode(imageNamed: "bg3")
        bg3.position = CGPointMake(517, 500)
        bg3.zPosition = 1
        self.addChild(bg3)
    }
    
    func setupGround() {
        
        moveGroundAction = SKAction.moveByX(GROUND_SPEED, y: 0, duration: 0.02)
        moveGroundActionForever = SKAction.repeatActionForever(moveGroundAction)
        
        for x in 0 ..< ASP_PIECES {
            let asp = SKSpriteNode(imageNamed: "asphalt")
            asphaltPieces.append(asp)
            
            if x == 0 {
                let start = CGPointMake(0, 144)
                asp.position = start
            } else {
                asp.position = CGPointMake(asp.size.width + asphaltPieces[x - 1].position.x, asphaltPieces[x - 1].position.y)
            }
            
            asp.runAction(moveGroundActionForever)
            
            self.addChild(asp)
        }
        
    }
    
    func groundMovement() {
        for x in 0 ..< asphaltPieces.count {
            
            if asphaltPieces[x].position.x <= GROUND_X_Reset {
                var index: Int!
                
                if x == 0 {
                    index = asphaltPieces.count - 1
                } else {
                    index = x - 1
                }
                
                let newPos = CGPointMake(asphaltPieces[index].position.x + asphaltPieces[x].size.width, asphaltPieces[x].position.y)
                
                asphaltPieces[x].position = newPos
            }
            
        }
    }
    

    
}
