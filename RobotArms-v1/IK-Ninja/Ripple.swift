//
//  Ripple.swift
//  IK-Ninja
//
//  Created by 山田一希 on 2017/12/11.
//  Copyright © 2017年 Ken Toh. All rights reserved.
//

import Foundation
import SpriteKit

class Ripple {
    var circle = SKShapeNode(circleOfRadius: 5)

    init() {
        
    }

    func sceneConfiguration(scene: SKScene) {
        scene.addChild(circle)
    }

    func position(location: CGPoint)  {
        circle.position = location
    }

    func startExtending() {
        let scaling = SKAction.scale(to: 50, duration: 4)
        //let fadeAlpha = SKAction.fadeAlpha(to: 0, duration: 3)
        let fadeOut = SKAction.fadeOut(withDuration: 1)
        //let colorize = SKAction.colorize(withColorBlendFactor: 0, duration: 3)
        let allAction = SKAction.group([scaling, fadeOut])
        circle.run(allAction)
    }
}
