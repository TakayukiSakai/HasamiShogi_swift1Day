//
//  GameScene.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

class GameScene: SKScene {
    // 0: 先手コマ選択
    // 1: 先手コマ配置場所選択
    // 2: 後手コマ選択状態
    // 3: 後手コマ配置場所選択
    var state: Int = 0
    
    var judge: Judge?
    
    var masu_arr: [[Masu]] = []
    var mikata_koma_arr: [MikataKoma] = []
    var teki_koma_arr: [TekiKoma] = []
    
    override func didMoveToView(view: SKView) {
        judge = Judge(scene: self)
        
        let path : String! = NSBundle.mainBundle().pathForResource("config", ofType: "json")
        let fileHandle : NSFileHandle! = NSFileHandle(forReadingAtPath: path)
        let data : NSData = fileHandle.readDataToEndOfFile()
        var config: NSDictionary = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions.AllowFragments,
            error: nil) as NSDictionary
        
        println(config.objectForKey("masu")!.objectForKey("width")!)
        
        let x_center:CGFloat = CGRectGetMidX(self.frame)
        let y_center:CGFloat = CGRectGetMidX(self.frame)
        let masu_width:CGFloat = CGFloat(config.objectForKey("masu")!.objectForKey("width")!.floatValue)
        let masu_height:CGFloat = CGFloat(config.objectForKey("masu")!.objectForKey("height")!.floatValue)
        
        var coordinate: Coordinate = Coordinate(x_cen: x_center, y_cen: y_center, width: masu_width, height: masu_height)
        
        // 盤面配置
        for x in (1...9) {
            masu_arr.append([])
            for y in (1...9) {
                let masu = Masu(x: x, y: y, coord: coordinate, scene: self)
                masu_arr[x-1].append(masu)
            }
        }
        
        // コマ配置
        for x in (1...9) {
            let mikata_koma = MikataKoma(x: x, y: 9, coord: coordinate, scene: self)
            mikata_koma_arr.append(mikata_koma)
            let teki_koma = TekiKoma(x: x, y: 1, coord: coordinate, scene: self)
            teki_koma_arr.append(teki_koma)
        }
        
        
        let sente_counter: Counter = Counter(scene: self, prefix: "先手: ", location: CGPoint(
            x:x_center - 0,
            y:y_center - 200
        ))
        
        let gote_counter: Counter = Counter(scene: self, prefix: "後手: ", location: CGPoint(
            x:x_center + 100,
            y:y_center - 200
        ))
        
        let matta_button: MattaButton = MattaButton(text: "待った！")
        matta_button.position = CGPoint(
            x:x_center - 100,
            y:y_center - 200
        )
        self.addChild(matta_button)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
