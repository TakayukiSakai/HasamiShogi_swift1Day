//
//  TekiKoma.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

class TekiKoma : Koma {
    override init(x: Int, y: Int, coord: Coordinate, scene: GameScene) {
        super.init(x: x, y: y, coord: coord, scene: scene)
        self.node = Koma_SKSpriteNode(koma: self, imageNamed:"koma_to_r")
        
        var rawCoord = self.coord.getRawCoodinate(x, y: y)
        self.node!.position = CGPoint(
            x:rawCoord.x,
            y:rawCoord.y
        )
        scene.addChild(self.node!)
    }
}
