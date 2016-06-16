//
//  GameManager.swift
//  RetroSkate
//
//  Created by Chase McElroy on 6/15/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import SpriteKit

class GameManager {
    static let sharedInstance = GameManager()
    
    let MOVEMENT_SPEED: CGFloat = -8.5
    
    //Colliders
    
    let COLLIDER_OBSTACLE: UInt32 = 1 << 0
    let COLLIDER_PLAYER: UInt32 = 1 << 0
}