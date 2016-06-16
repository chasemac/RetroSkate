//
//  DumpsterTop.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/16/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class DumpsterTop: Obstacle {
    convenience init() {
        self.init(color: UIColor.clearColor(), size: CGSizeMake(100, 2))
        self.yPosStart = 220
    }
    
    override func initPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        self.physicsBody?.categoryBitMask = GameManager.sharedInstance.COLLIDER_RIDEABLE
        self.zPosition = 6
        
        super.initPhysics()
    }
}
