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
        self.yPos = 180
        self.zPosition = 9
        
    }
    
    override func initPhysics() {
        
        let frontCollider = SKPhysicsBody(rectangleOfSize: CGSizeMake(5, self.size.height), center: CGPointMake(-(self.size.width / 2), 0))
        
        let topCollider = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.size.width * 0.80, 5), center: CGPointMake(0, self.size.height / 2 - 7))
        
        self.physicsBody = SKPhysicsBody(bodies: [frontCollider, topCollider])
        
        self.zPosition = 5
        
        super.initPhysics()
    }
}
