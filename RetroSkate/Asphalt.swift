//
//  Asphalt.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/15/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import SpriteKit
//
//class Asphalt: Scenery {
//    convenience init() {
//        self.init(imageNamed: "asphalt")
//    }
//    
//    func setupGround() {
//        for x in 0 ..< ASP_PIECES {
//            
//            
//            let collider = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.size.width, 5), center: CGPointMake(0, -20))
//            
//            collider.dynamic = false
//            self.physicsBody = collider
//            
//            asphaltPieces.append(self)
//            
//            if x == 0 {
//                let start = CGPointMake(0, 144)
//                self.position = start
//            } else {
//                self.position = CGPointMake(self.size.width + asphaltPieces[x - 1].position.x, asphaltPieces[x - 1].position.y)
//            }
//            
//            //    asp.runAction(moveForever)
//            
//            self.addChild(self)
//        }
//        
//
//    }
//}