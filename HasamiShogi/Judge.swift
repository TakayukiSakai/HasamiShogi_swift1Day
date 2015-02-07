//
//  Judge.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

class Judge {
    let scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func availableCoord(x: Int, y: Int) {
        var tmp_x, tmp_y: Int
        
        // 右
        tmp_x = x
        tmp_y = y
        while (!self.koma_exists(--tmp_x, y: tmp_y)) {
            self.scene.masu_arr[tmp_x-1][tmp_y-1].candidate()
        }
        
        // 上
        tmp_x = x
        tmp_y = y
        while (!self.koma_exists(tmp_x, y: --tmp_y)) {
            self.scene.masu_arr[tmp_x-1][tmp_y-1].candidate()
        }
        
        // 左
        tmp_x = x
        tmp_y = y
        while (!self.koma_exists(++tmp_x, y: tmp_y)) {
            self.scene.masu_arr[tmp_x-1][tmp_y-1].candidate()
        }
        
        // 上
        tmp_x = x
        tmp_y = y
        while (!self.koma_exists(tmp_x, y: ++tmp_y)) {
            self.scene.masu_arr[tmp_x-1][tmp_y-1].candidate()
        }
    }
    
    func koma_exists(x: Int, y: Int) -> Bool {
        if (!(1 <= x && x <= 9 && 1 <= y && y <= 9)) {return true}
        println(x.description + ", " + y.description)
        for koma in self.scene.mikata_koma_arr {
            if (koma.x == x && koma.y == y) {return true}
        }
        for koma in self.scene.teki_koma_arr {
            if (koma.x == x && koma.y == y) {return true}
        }
        return false
    }
}
