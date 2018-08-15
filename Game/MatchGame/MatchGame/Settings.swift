//
//  Settings.swift
//  MatchGame
//
//  Created by MacStudent on 2018-08-15.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import SpriteKit

enum PhysicsCategories{
    
    static let none: UInt32 = 0
    static let ballCategory: UInt32 = 0x1         //01
    static let switchCategory: UInt32 = 0x1 << 1    //10
    
}


enum ZPosition{
    static let label: CGFloat = 0
     static let ball: CGFloat = 1
     static let colorSwitch: CGFloat = 2
}

