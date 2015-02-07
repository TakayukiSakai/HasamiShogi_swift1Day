//
//  Koma.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

class Koma {
    var x:Int
    var y:Int
    var coord:Coordinate
    let scene: GameScene
    var node: Koma_SKSpriteNode?
    var selected: Bool = false
    
    init(x: Int, y: Int, coord: Coordinate, scene: GameScene) {
        self.x = x
        self.y = y
        self.coord = coord
        self.scene = scene
    }
    
    func setCoord (x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func moveTo(x: Int, y: Int) {
        self.setCoord(x, y: y)
        
        var rawCoord = self.coord.getRawCoodinate(x, y: y)
        self.node!.position = CGPoint(
            x:rawCoord.x,
            y:rawCoord.y
        )
        self.scene.judge!.take(self)
    }
    
    func movedOut() {
        let travelTime = SKAction.moveTo(CGPoint(
            x: 1000,
            y: 1000
        ), duration: 3)
        self.node!.runAction(travelTime)
//        self.node = nil
    }
    
    // コマがタッチされたときに呼ばれる
    func touched() {
        println("koma at (" + self.x.description + ", " + self.y.description + ") was touched!")
        self.scene.judge!.availableCoord(self.x, y: self.y)
    }
    
    func cancelSelect() {}
}