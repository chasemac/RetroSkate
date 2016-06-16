//
//  Dirt.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/15/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

//import SpriteKit
//
//class Scenery: Moveable {
//
//    var TotalGroundPieces: Int = 15
//    let groundXReset: CGFloat = -150
//    var groundPieces = [SKSpriteNode]()
//    
//    
//    convenience init() {
//        self.init()
//       self.xPosStart = groundXReset
//    }
//
//    
//    func setupGround() {
//        
//        for x in 0 ..< TotalGroundPieces {
//
//            
//            groundPieces.append(self)
//            
//            if x == 0 {
//                let start = CGPointMake(0, yPosStart)
//                self.position = start
//            } else {
//                self.position = CGPointMake(self.size.width + groundPieces[x - 1].position.x, groundPieces[x - 1].position.y)
//            }
//            self.zPosition = 5
//            
//            addChild(self)
//        }
//        
//    }
//    
//    func groundMovement() {
//        
//        
//        for x in 0 ..< groundPieces.count {
//            
//            if groundPieces[x].position.x <= groundXReset {
//                var index: Int!
//                
//                if x == 0 {
//                    index = groundPieces.count - 1
//                } else {
//                    index = x - 1
//                }
//                
//                let newPos = CGPointMake(groundPieces[index].position.x + groundPieces[x].size.width, groundPieces[x].position.y)
//                
//                groundPieces[x].position = newPos
//                
//                
//            }
//            
//        }
//        
//    }
//}