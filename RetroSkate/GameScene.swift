//
//  GameScene.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/11/16.
//  Copyright (c) 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //Scenery setup
    let ASP_PIECES = 15
    let SIDEWALK_PIECES = 24
    let GROUND_X_Reset: CGFloat = -150
    let BG_X_RESET: CGFloat = -912.0
    var asphaltPieces = [SKSpriteNode]()
    var sidewalkPieces = [SKSpriteNode]()
    
    var backgroundPieces = [SKSpriteNode]()
    
    var moveGroundAction: SKAction!
    var moveGroundActionForever: SKAction!
    var backgroundActions = [SKAction]()
    
    var player: Player!
    
    override func didMoveToView(view: SKView) {
        
        setupBackground()
        setupGround()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tap.allowedPressTypes = [NSNumber(integer: UIPressType.Select.rawValue)]
        self.view?.addGestureRecognizer(tap)
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -10)
        self.physicsWorld.contactDelegate = self
        
        player = Player()
        self.addChild(player)
        let dumpster = Dumpster()
        self.addChild(dumpster)
        dumpster.startMoving()
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        groundMovement()
        
        
        for child in self.children {
            child.update()
        }
    }
    
    func setupBackground() {
        
        var action: SKAction!
        
        for i in 0 ..< 3 {
            for x in 0 ..< 3 {
                let bg = SKSpriteNode(imageNamed: "bg\(i)")
                bg.position = CGPointMake(CGFloat(x) * bg.size.width, 400 + CGFloat(i))
                print(bg.position)
                bg.zPosition = CGFloat(i) + 1
                backgroundPieces.append(bg)
                action = SKAction.repeatActionForever(SKAction.moveByX(-2.0, y: 0, duration: 0.02))
                bg.runAction(action)
                backgroundActions.append(action)
                self.addChild(bg)
            }
            
        }
        
        
    }
    
    func setupGround() {
        
        moveGroundAction = SKAction.moveByX(GameManager.sharedInstance.MOVEMENT_SPEED, y: 0, duration: 0.02)
        moveGroundActionForever = SKAction.repeatActionForever(moveGroundAction)
        
        for x in 0 ..< ASP_PIECES {
            let asp = SKSpriteNode(imageNamed: "asphalt")
            
            let collider = SKPhysicsBody(rectangleOfSize: CGSizeMake(asp.size.width, 5), center: CGPointMake(0, -20))
            
            collider.dynamic = false
            asp.physicsBody = collider
            
            asphaltPieces.append(asp)
            
            if x == 0 {
                let start = CGPointMake(0, 144)
                asp.position = start
            } else {
                asp.position = CGPointMake(asp.size.width + asphaltPieces[x - 1].position.x, asphaltPieces[x - 1].position.y)
            }
            
            asp.runAction(moveGroundActionForever)
            
            self.addChild(asp)
        }
        
        for x in 0 ..< SIDEWALK_PIECES {
            let piece = SKSpriteNode(imageNamed: "sidewalk")
            
            sidewalkPieces.append(piece)
            
            if x == 0 {
                let start = CGPointMake(0, 190)
                piece.position = start
            } else {
                piece.position = CGPointMake(piece.size.width + sidewalkPieces[x - 1].position.x, sidewalkPieces[x - 1].position.y)
            }
            
            piece.zPosition = 5
            piece.runAction(moveGroundActionForever)
            
            self.addChild(piece)
        }
        
    }
    
    func groundMovement() {
        for x in 0 ..< asphaltPieces.count {
            
            if asphaltPieces[x].position.x <= GROUND_X_Reset {
                var index: Int!
                
                if x == 0 {
                    index = asphaltPieces.count - 1
                } else {
                    index = x - 1
                }
                
                let newPos = CGPointMake(asphaltPieces[index].position.x + asphaltPieces[x].size.width, asphaltPieces[x].position.y)
                
                asphaltPieces[x].position = newPos
            }
            
        }
        
        for x in 0 ..< sidewalkPieces.count {
            
            if sidewalkPieces[x].position.x <= GROUND_X_Reset {
                var index: Int!
                
                if x == 0 {
                    index = sidewalkPieces.count - 1
                } else {
                    index = x - 1
                }
                
                let newPos = CGPointMake(sidewalkPieces[index].position.x + sidewalkPieces[x].size.width, sidewalkPieces[x].position.y)
                
                sidewalkPieces[x].position = newPos
            }
            
        }
        
        
        
        for x in 0 ..< 3 {
            
            if backgroundPieces[x].position.x <= BG_X_RESET {
                var index: Int!
                
                if x == 0 {
                    index = backgroundPieces.count - 1
                } else {
                    index = x - 1
                }
                
                let newPos = CGPointMake(backgroundPieces[index].position.x + backgroundPieces[x].size.width, backgroundPieces[x].position.y)
                
                backgroundPieces[x].position = newPos
            }
        }
        
        
    }
    
    func tapped(gesture: UITapGestureRecognizer) {
        player.jump()
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        if contact.bodyA.categoryBitMask == GameManager.sharedInstance.COLLIDER_OBSTACLE || contact.bodyB.categoryBitMask == GameManager.sharedInstance.COLLIDER_OBSTACLE {
            print("boom we hit it!")
        }
    }
}
