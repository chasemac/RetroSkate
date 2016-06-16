//
//  Dumpster.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/15/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class Dumpster: Obstacle {
    convenience init() {
        self.init(imageNamed: "dumpster")
        self.yPosStart = 180

        
    }
    
    override func initPhysics() {
        
        let frontCollider = SKPhysicsBody(rectangleOfSize: CGSizeMake(5, self.size.height - 50), center: CGPointMake(-(self.size.width / 2), 0))
        
        frontCollider.categoryBitMask = GameManager.sharedInstance.COLLIDER_OBSTACLE
        frontCollider.contactTestBitMask = GameManager.sharedInstance.COLLIDER_PLAYER

        
        self.physicsBody = frontCollider
        
        self.zPosition = 6
        
        super.initPhysics()
    }
}
