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
        self.node!.zPosition = 1.0
        
        var rawCoord = self.coord.getRawCoodinate(x, y: y)
        self.node!.position = CGPoint(
            x:rawCoord.x,
            y:rawCoord.y
        )
        scene.addChild(self.node!)
    }
    
    override func touched() {
        if (self.scene.state == 2) {
            super.touched()
            if (self.selected) {
                self.node!.texture = SKTexture(imageNamed: "koma_to_r")
            } else {
                self.node!.texture = SKTexture(imageNamed: "koma_to_hover_r")
            }
            self.selected = !self.selected
            self.scene.candidated_koma = self
            self.scene.state = 3
        }
    }
    
    override func cancelSelect() {
        if (self.selected) {
            self.node!.texture = SKTexture(imageNamed: "koma_to_r")
            self.selected = false
        }
    }
}
