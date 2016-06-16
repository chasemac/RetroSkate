//
//  Asphalt.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/15/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//
//
//import SpriteKit
//
//class Asphalt: Scenery {
//    convenience init() {
//        self.init(imageNamed: "asphalt")
//        self.TotalGroundPieces = 15
//        self.yPosStart = 144
//    }
//    
//    override func setupGround() {
//            let collider = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.size.width, 5), center: CGPointMake(0, -20))
//            
//            collider.dynamic = false
//            self.physicsBody = collider
//        
//        super.setupGround()
//
//    }
//}