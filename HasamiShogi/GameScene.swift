//
//  GameScene.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        let path : String! = NSBundle.mainBundle().pathForResource("config", ofType: "json")
        let fileHandle : NSFileHandle! = NSFileHandle(forReadingAtPath: path)
        let data : NSData = fileHandle.readDataToEndOfFile()
        var config: NSDictionary = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions.AllowFragments,
            error: nil) as NSDictionary
        
        println(config.objectForKey("masu")!.objectForKey("width")!)
        
        let masu = SKSpriteNode(imageNamed:"00_masu")
        masu.position = CGPoint(
            x:CGRectGetMidX(self.frame),
            y:CGRectGetMidY(self.frame)
        )
        
        self.addChild(masu)
        println(masu.size.width)
        
        let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
        println("Bounds width: \(myBoundSize.width) height: \(myBoundSize.height)")
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
