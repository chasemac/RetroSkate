//
//  Player.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/15/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    //Character setup
    var charPushFrames = [SKTexture]()
    var charCrashFrames = [SKTexture]()
    let CHAR_X_POS: CGFloat = 158
    let CHAR_Y_POS: CGFloat = 180
    var isJumping: Bool = false
    
    convenience init() {
        self.init(imageNamed: "push0")
        setupCharacter()
    }
    
    func setupCharacter() {
        
        for x in 0 ..< 9 {
            charPushFrames.append(SKTexture(imageNamed: "push\(x)"))
        }
        
        for x in 0 ..< 9 {
            charCrashFrames.append(SKTexture(imageNamed: "crash\(x)"))
        }
        
        self.position = CGPointMake(CHAR_X_POS, CHAR_Y_POS)
        self.zPosition = 10
        
        
        
        let frontColliderSize = CGSizeMake(5, self.size.height * 0.80)
        let frontCollider = SKPhysicsBody(rectangleOfSize: frontColliderSize, center: CGPointMake(25, 0))
        
        let bottomColliderSize = CGSizeMake(self.size.width / 2, 5)
        let bottomCollider = SKPhysicsBody(rectangleOfSize: bottomColliderSize, center: CGPointMake(0, -(self.size.height / 2) + 5))
        
        self.physicsBody = SKPhysicsBody(bodies: [frontCollider,bottomCollider])
        
        self.physicsBody?.restitution = 0
        self.physicsBody?.linearDamping = 0.1
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.mass = 0.1
        self.physicsBody?.dynamic = true
        
        self.physicsBody?.categoryBitMask = GameManager.sharedInstance.COLLIDER_PLAYER
        self.physicsBody?.contactTestBitMask = GameManager.sharedInstance.COLLIDER_OBSTACLE
        
        playPushAnim()
        
    }
    
    func playPushAnim() {
        self.removeAllActions()
        self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(charPushFrames, timePerFrame: 0.1)))
    }
    
    func playCrashAnim() {
        self.removeAllActions()
        self.runAction(SKAction.animateWithTextures(charCrashFrames, timePerFrame: 0.4))
    }
    
    func jump() {
        if isJumping == false {
            isJumping = true
            let impulseX: CGFloat = 0
            let impulesY: CGFloat = 60.0
            self.runAction(SKAction.playSoundFileNamed("sfxOllie.wav", waitForCompletion: false))
            self.physicsBody?.applyImpulse(CGVectorMake(impulseX, impulesY))
        }
    }
    
    override func update() {
        if isJumping {
            if floor(self.physicsBody!.velocity.dy) == 0 {
                isJumping = false
            }
        }
    }
}
