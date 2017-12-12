//
//  RobotArmIK.swift
//  IK-Ninja
//
//  Created by 山田一希 on 2017/12/11.
//  Copyright © 2017年 Ken Toh. All rights reserved.
//

import SpriteKit

class RobotArmIK {

    let sectionLength: CGFloat = 100
    let sectionRect = CGRect(x: -10, y: -100, width: 20, height: 100)
    let upperArm : SKShapeNode
    let midArm : SKShapeNode
    let lowerArm : SKShapeNode
    let shoulder = SKShapeNode(circleOfRadius: 5)
    let elbow = SKShapeNode(circleOfRadius: 5)
    let wrist = SKShapeNode(circleOfRadius: 5)
    let endEffector = SKShapeNode(circleOfRadius: 5)

    init() {
        upperArm = SKShapeNode(rect: sectionRect)
        midArm = SKShapeNode(rect: sectionRect)
        lowerArm = SKShapeNode(rect: sectionRect)
    }


    func position(x: CGFloat, y: CGFloat) {
        shoulder.position = CGPoint(x: x, y: y)
    }

    func sceneConfiguration(scene: SKScene) {
        scene.addChild(shoulder)
        shoulder.addChild(upperArm)
        upperArm.addChild(elbow)
        elbow.addChild(midArm)
        midArm.addChild(wrist)
        wrist.addChild(lowerArm)
        lowerArm.addChild(endEffector)

        let positionConstraint = SKConstraint.positionY(SKRange(constantValue: -sectionLength))
        elbow.constraints =  [ positionConstraint ]
        wrist.constraints = [ positionConstraint ]
        endEffector.constraints = [ positionConstraint ]
    }

    func reach(to location: CGPoint) {
        //let randomDouble = Double(arc4random_uniform(2)) + 0.5
        //print(randomDouble)
        let reachAction = SKAction.reach(to: location, rootNode: self.shoulder, duration: 0.5)
        self.endEffector.run(reachAction)

    }
}
