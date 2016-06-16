////
////  Dirt.swift
////  RetroSkate
////
////  Created by Chase McElroy on 6/15/16.
////  Copyright © 2016 Chase McElroy. All rights reserved.
////
//
//import SpriteKit
//
//class Scenery: SKSpriteNode {
//    let ASP_PIECES = 15
//    let SIDEWALK_PIECES = 24
//    let GROUND_X_Reset: CGFloat = -150
//    
//    var asphaltPieces = [SKSpriteNode]()
//    var sidewalkPieces = [SKSpriteNode]()
//    
//    var moveAction: SKAction!
//    var moveForever: SKAction!
//    
//    func setupGround() {
//        
//        moveAction = SKAction.moveByX(GameManager.sharedInstance.MOVEMENT_SPEED, y: 0, duration: 0.02)
//        moveForever = SKAction.repeatActionForever(moveAction)
//        
//        for x in 0 ..< ASP_PIECES {
//            let asp = SKSpriteNode(imageNamed: "asphalt")
//            
//            let collider = SKPhysicsBody(rectangleOfSize: CGSizeMake(asp.size.width, 5), center: CGPointMake(0, -20))
//            
//            collider.dynamic = false
//            asp.physicsBody = collider
//            
//            asphaltPieces.append(asp)
//            
//            if x == 0 {
//                let start = CGPointMake(0, 144)
//                asp.position = start
//            } else {
//                asp.position = CGPointMake(asp.size.width + asphaltPieces[x - 1].position.x, asphaltPieces[x - 1].position.y)
//            }
//            
//            asp.runAction(moveForever)
//            
//            self.addChild(asp)
//        }
//        
//        for x in 0 ..< SIDEWALK_PIECES {
//            let piece = SKSpriteNode(imageNamed: "sidewalk")
//            
//            sidewalkPieces.append(piece)
//            
//            if x == 0 {
//                let start = CGPointMake(0, 190)
//                piece.position = start
//            } else {
//                piece.position = CGPointMake(piece.size.width + sidewalkPieces[x - 1].position.x, sidewalkPieces[x - 1].position.y)
//            }
//            
//            piece.zPosition = 5
//            piece.runAction(moveForever)
//            
//            self.addChild(piece)
//        }
//        
//    }
//    
//    func groundMovement() {
//        
//        
//        for x in 0 ..< asphaltPieces.count {
//            
//            if asphaltPieces[x].position.x <= GROUND_X_Reset {
//                var index: Int!
//                
//                if x == 0 {
//                    index = asphaltPieces.count - 1
//                } else {
//                    index = x - 1
//                }
//                
//                let newPos = CGPointMake(asphaltPieces[index].position.x + asphaltPieces[x].size.width, asphaltPieces[x].position.y)
//                
//                asphaltPieces[x].position = newPos
//                
//                
//            }
//            
//        }
//        
//        for x in 0 ..< sidewalkPieces.count {
//            
//            if sidewalkPieces[x].position.x <= GROUND_X_Reset {
//                var index: Int!
//                
//                if x == 0 {
//                    index = sidewalkPieces.count - 1
//                } else {
//                    index = x - 1
//                }
//                
//                let newPos = CGPointMake(sidewalkPieces[index].position.x + sidewalkPieces[x].size.width, sidewalkPieces[x].position.y)
//                
//                sidewalkPieces[x].position = newPos
//            }
//            
//        }
//    }
//}