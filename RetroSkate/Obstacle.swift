//
//  Obstacle.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/15/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class Obstacle: SKSpriteNode {
    
    static let RESET_X_POS: CGFloat = -800
    static let START_X_POS: CGFloat = 1800
    
    var moveAction: SKAction!
    var moveForever: SKAction!
    
    func startMoving() {
        self.position = CGPointMake(Obstacle.START_X_POS, 180)
        
        moveAction = SKAction.moveByX(GameManager.sharedInstance.MOVEMENT_SPEED, y: 0, duration: 0.02)
        moveForever = SKAction.repeatActionForever(moveAction)
        self.zPosition = 7
        
        self.initPhysics()
        
        self.runAction(moveForever)
        
    }
    
    override func update() {
        if self.position.x <= Obstacle.RESET_X_POS {
            self.position = CGPointMake(Obstacle.START_X_POS, self.position.y)
        }
    }
    
    func initPhysics() {
        self.physicsBody?.dynamic = false
        self.physicsBody?.categoryBitMask = GameManager.sharedInstance.COLLIDER_OBSTACLE
        self.physicsBody?.contactTestBitMask = GameManager.sharedInstance.COLLIDER_PLAYER
    }
}
