//
//  Koma_SKSpriteNode.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

class Koma_SKSpriteNode : SKSpriteNode {
    let koma: Koma
    
    init(koma: Koma, imageNamed: String) {
        self.koma = koma
        super.init(texture: SKTexture(imageNamed: imageNamed), color: UIColor.clearColor(), size: CGSizeMake(32, 32))
        self.userInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.koma.touched()
    }
}
