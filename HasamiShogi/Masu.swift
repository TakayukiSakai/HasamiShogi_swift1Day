//
//  Masu.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

class Masu {
    let x:Int
    let y:Int
    var coord:Coordinate
    let scene: GameScene
    var node: Masu_SKSpriteNode?
    var selected: Bool = false
    
    init(x: Int, y: Int, coord: Coordinate, scene: GameScene) {
        self.x = x
        self.y = y
        self.coord = coord
        self.scene = scene
        
        self.node = Masu_SKSpriteNode(masu: self, imageNamed:"koma_ho")
    }
    
    func touched() {
        println("koma at (" + self.x.description + ", " + self.y.description + ") was touched!")
    }
}
