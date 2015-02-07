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
    var candidated: Bool = false
    
    init(x: Int, y: Int, coord: Coordinate, scene: GameScene) {
        self.x = x
        self.y = y
        self.coord = coord
        self.scene = scene
        
        self.node = Masu_SKSpriteNode(masu: self, imageNamed:"masu")
        self.node!.zPosition = 0.0
        var rawCoord = self.coord.getRawCoodinate(x, y: y)
        self.node!.position = CGPoint(
            x:rawCoord.x,
            y:rawCoord.y
        )
        self.scene.addChild(self.node!)
    }
    
    // マスがタッチされたときに呼ばれる（上にコマがある場合は呼ばれない）
    func touched() {
        println("masu at (" + self.x.description + ", " + self.y.description + ") was touched!")
    }
    
    func candidate() {
        if (!self.candidated) {
            self.candidated = true
            self.node!.texture = SKTexture(imageNamed: "masu_hover")
        }
    }
    
    func cancel_candidate() {
        if (self.candidated) {
            self.candidated = false
            self.node!.texture = SKTexture(imageNamed: "masu")
        }
    }
}
