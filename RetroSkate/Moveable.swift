//
//  Moveable.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/16/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class Moveable: SKSpriteNode {
    static let resetXPos: CGFloat = -800
    
    
    
    
    var moveAction: SKAction!
    var moveForever: SKAction!
    var yPosStart: CGFloat = 0.0
    var xPosStart: CGFloat = 1800
    
    func startMoving() {
        self.position = CGPointMake(xPosStart, yPosStart)
        
        moveAction = SKAction.moveByX(GameManager.sharedInstance.MOVEMENT_SPEED, y: 0, duration: 0.02)
        moveForever = SKAction.repeatActionForever(moveAction)
        
        
        self.runAction(moveForever)
    }
    
    override func update() {
        if self.position.x <= Obstacle.resetXPos {
            didExceedBounds()
        }
    }
    
    func didExceedBounds() {
        self.position = CGPointMake(xPosStart, self.position.y)
    }
}
