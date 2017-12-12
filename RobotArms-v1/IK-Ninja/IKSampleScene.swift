//
//  IKSampleScene.swift
//  IK-Ninja
//
//  Created by 山田一希 on 2017/12/11.
//  Copyright © 2017年 Ken Toh. All rights reserved.
//

import SpriteKit


class IKSampleScene : SKScene {
    var robotArmIK1 = RobotArmIK()
    var robotArmIK2 = RobotArmIK()
    var robotArmIK3 = RobotArmIK()

    var robotArmIK4 = RobotArmIK()
    var robotArmIK5 = RobotArmIK()
    var robotArmIK6 = RobotArmIK()

//    var robotArmIK7 = RobotArmIK()
//    var robotArmIK8 = RobotArmIK()
//    var robotArmIK9 = RobotArmIK()


    var ripples = [Ripple]()

    let under_line : CGFloat = 0
    var left_line  : CGFloat = 0

    override func didMove(to view: SKView) {
        left_line = self.frame.midX - self.frame.midY

        robotArmIK1.sceneConfiguration(scene: scene!)
        robotArmIK1.position(x: self.frame.midX - 60, y: self.frame.height - 20)

        robotArmIK2.sceneConfiguration(scene: scene!)
        robotArmIK2.position(x: self.frame.midX, y: self.frame.height - 20)

        robotArmIK3.sceneConfiguration(scene: scene!)
        robotArmIK3.position(x: self.frame.midX + 60, y: self.frame.height - 20)

        robotArmIK4.sceneConfiguration(scene: scene!)
        robotArmIK4.position(x: self.frame.midX - 60, y: self.under_line)

        robotArmIK5.sceneConfiguration(scene: scene!)
        robotArmIK5.position(x: self.frame.midX, y: self.under_line)

        robotArmIK6.sceneConfiguration(scene: scene!)
        robotArmIK6.position(x: self.frame.midX + 60, y: self.under_line)

//        robotArmIK7.sceneConfiguration(scene: scene!)
//        robotArmIK7.position(x: left_line, y: self.frame.midY - 60)
//
//        robotArmIK8.sceneConfiguration(scene: scene!)
//        robotArmIK8.position(x: left_line, y: self.frame.midY)
//
//        robotArmIK9.sceneConfiguration(scene: scene!)
//        robotArmIK9.position(x: left_line, y: self.frame.midY + 60)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let ripple = Ripple()
            ripple.sceneConfiguration(scene: scene!)

            robotArmIK1.reach(to: location)
            robotArmIK2.reach(to: location)
            robotArmIK3.reach(to: location)

            robotArmIK4.reach(to: location)
            robotArmIK5.reach(to: location)
            robotArmIK6.reach(to: location)

//            robotArmIK7.reach(to: location)
//            robotArmIK8.reach(to: location)
//            robotArmIK9.reach(to: location)

            ripple.position(location: location)
            ripple.startExtending()
            //scene!.removeChildren(in: [ripple.circle])
        }
    }


}
