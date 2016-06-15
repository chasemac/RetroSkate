//
//  GameScene.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/11/16.
//  Copyright (c) 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //Scenery setup
    let ASP_PIECES = 15
    let GROUND_SPEED: CGFloat = -8.5
    let GROUND_X_Reset: CGFloat = -150
    var moveGroundAction: SKAction!
    var moveGroundActionForever: SKAction!
    var asphaltPieces = [SKSpriteNode]()
    
    //Character setup
    var charPushFrames = [SKTexture]()
    let CHAR_X_POS: CGFloat = 158
    let CHAR_Y_POS: CGFloat = 180
    var character: SKSpriteNode!
    var isJumping: Bool = false
    
    override func didMoveToView(view: SKView) {
        
        setupBackground()
        setupGround()
        setupCharacter()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(jump))
        tap.allowedPressTypes = [NSNumber(integer: UIPressType.Select.rawValue)]
        self.view?.addGestureRecognizer(tap)
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        groundMovement()
        
        if isJumping {
            if floor(character.physicsBody!.velocity.dy) == 0 {
                isJumping = false
            }
        }
    }
    
    func setupBackground() {
        let bg = SKSpriteNode(imageNamed: "bg1")
        bg.position = CGPointMake(517, 400)
        bg.zPosition = 3
        self.addChild(bg)
        
        let bg2 = SKSpriteNode(imageNamed: "bg2")
        bg2.position = CGPointMake(517, 450)
        bg2.zPosition = 2
        self.addChild(bg2)
        
        let bg3 = SKSpriteNode(imageNamed: "bg3")
        bg3.position = CGPointMake(517, 500)
        bg3.zPosition = 1
        self.addChild(bg3)
    }
    
    func setupGround() {
        
        moveGroundAction = SKAction.moveByX(GROUND_SPEED, y: 0, duration: 0.02)
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
    }
    
    func setupCharacter() {
        
        for x in 0 ..< 12 {
            charPushFrames.append(SKTexture(imageNamed: "push\(x)"))
        }
        
        character = SKSpriteNode(texture: charPushFrames[0])
        self.addChild(character)
        
        character.position = CGPointMake(CHAR_X_POS, CHAR_Y_POS)
        character.zPosition = 10
        
        character.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(charPushFrames, timePerFrame: 0.1)))
        
        let frontColliderSize = CGSizeMake(5, character.size.height * 0.80)
        let frontCollider = SKPhysicsBody(rectangleOfSize: frontColliderSize, center: CGPointMake(25, 0))
        
        let bottomColliderSize = CGSizeMake(character.size.width / 2, 5)
        let bottomCollider = SKPhysicsBody(rectangleOfSize: bottomColliderSize, center: CGPointMake(0, -(character.size.height / 2) + 5))
        
        character.physicsBody = SKPhysicsBody(bodies: [frontCollider,bottomCollider])
        
        character.physicsBody?.restitution = 0
        character.physicsBody?.linearDamping = 0.1
        character.physicsBody?.allowsRotation = false
        character.physicsBody?.mass = 0.1
        character.physicsBody?.dynamic = true
        self.physicsWorld.gravity = CGVectorMake(0.0, -10)
    }
    
    func jump(gesture: UITapGestureRecognizer) {
        
        if isJumping == false {
            isJumping = true
            let impulseX: CGFloat = 0
            let impulesY: CGFloat = 60.0
            character.physicsBody?.applyImpulse(CGVectorMake(impulseX, impulesY))
        }
    }
    
}
