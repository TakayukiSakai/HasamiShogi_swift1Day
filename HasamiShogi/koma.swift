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
    }
}