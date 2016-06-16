//
//  Obstacle.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/15/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class Obstacle: Moveable {
    
    override func startMoving() {
        super.startMoving()
        self.initPhysics()
    }
    
    func initPhysics() {
        self.physicsBody?.dynamic = false
        self.physicsBody?.categoryBitMask = GameManager.sharedInstance.COLLIDER_OBSTACLE
        self.physicsBody?.contactTestBitMask = GameManager.sharedInstance.COLLIDER_PLAYER
    }
}
