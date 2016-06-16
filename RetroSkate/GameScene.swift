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
    var farBG = [SKSpriteNode]()
    var midBG = [SKSpriteNode]()
    var frontBG = [SKSpriteNode]()
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
        
        for x in 0 ..< 3 {
            let bg0 = SKSpriteNode(imageNamed: "bg0")
            bg0.position = CGPointMake(CGFloat(x) * bg0.size.width, 400)
            print(bg0.position)
            bg0.zPosition = 3
            frontBG.append(bg0)
            action = SKAction.repeatActionForever(SKAction.moveByX(-2.0, y: 0, duration: 0.02))
            bg0.runAction(action)
            backgroundActions.append(action)
            self.addChild(bg0)
            
            let bg1 = SKSpriteNode(imageNamed: "bg1")
            bg1.position = CGPointMake(CGFloat(x) * bg1.size.width, 450)
            bg1.zPosition = 2
            midBG.append(bg1)
            action = SKAction.repeatActionForever(SKAction.moveByX(-1.0, y: 0, duration: 0.02))
            bg1.runAction(action)
            backgroundActions.append(action)
            self.addChild(bg1)
            
            let bg2 = SKSpriteNode(imageNamed: "bg2")
            bg2.position = CGPointMake(CGFloat(x) * bg2.size.width, 500)
            bg2.zPosition = 1
            farBG.append(bg2)
            action = SKAction.repeatActionForever(SKAction.moveByX(-0.5, y: 0, duration: 0.02))
            bg2.runAction(action)
            backgroundActions.append(action)
            self.addChild(bg2)
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
            
            if farBG[x].position.x <= BG_X_RESET {
                var index: Int!
                
                if x == 0 {
                    index = farBG.count - 1
                } else {
                    index = x - 1
                }
                
                let newPos = CGPointMake(farBG[index].position.x + farBG[x].size.width, farBG[x].position.y)
                
                farBG[x].position = newPos
            }
        }

        for x in 0 ..< 3 {
            if midBG[x].position.x <= BG_X_RESET {
                var index: Int!
                
                if x == 0 {
                    index = midBG.count - 1
                } else {
                    index = x - 1
                }
                
                let newPos = CGPointMake(midBG[index].position.x + midBG[x].size.width, midBG[x].position.y)
                
                midBG[x].position = newPos
            }
        }
        
            for x in 0 ..< 3 {
            if frontBG[x].position.x <= BG_X_RESET {
                var index: Int!
                
                if x == 0 {
                    index = frontBG.count - 1
                } else {
                    index = x - 1
                }
                
                let newPos = CGPointMake(frontBG[index].position.x + frontBG[x].size.width, frontBG[x].position.y)
                
                frontBG[x].position = newPos
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
