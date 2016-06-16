//
//  Building.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/16/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import SpriteKit


class Building: Moveable {
    convenience init() {
        self.init(imageNamed: "building\(arc4random_uniform(8))")
        self.anchorPoint = CGPointMake(0.5, 0)
        self.yPosStart = 200
        self.zPosition = 4
    }
    
    override func didExceedBounds() {
        super.didExceedBounds()
        self.texture = SKTexture(imageNamed: "building\(arc4random_uniform(8))")
    }
    
}
