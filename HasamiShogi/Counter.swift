//
//  Counter.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

class Counter {
    var count: Int = 0
    let prefix: String
    var scene: GameScene
    let label: SKLabelNode
    
    init (scene: GameScene, prefix: String, location: CGPoint) {
        self.scene = scene
        self.prefix = prefix
        
        label = SKLabelNode(fontNamed:"Arial")
        label.fontSize = 24
        label.position = location
        self.reset()
        self.scene.addChild(label)
    }
    
    func increment() {
        self.count++
        label.text = prefix + self.count.description
    }
    
    func reset() {
        self.count = 0
        label.text = prefix + "0"
    }
}



