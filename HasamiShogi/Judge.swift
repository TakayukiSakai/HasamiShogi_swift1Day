//
//  Judge.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

extension Array {
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in enumerate(self) {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.removeAtIndex(index!)
        }
    }
}

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
        while (--tmp_x >= 1 && !self.koma_exists(tmp_x, y: tmp_y)) {
            self.scene.masu_arr[tmp_x-1][tmp_y-1].candidate()
        }
        
        // 上
        tmp_x = x
        tmp_y = y
        while (--tmp_y >= 1 && !self.koma_exists(tmp_x, y: tmp_y)) {
            self.scene.masu_arr[tmp_x-1][tmp_y-1].candidate()
        }
        
        // 左
        tmp_x = x
        tmp_y = y
        while (++tmp_x <= 9 && !self.koma_exists(tmp_x, y: tmp_y)) {
            self.scene.masu_arr[tmp_x-1][tmp_y-1].candidate()
        }
        
        // 上
        tmp_x = x
        tmp_y = y
        while (++tmp_y <= 9 && !self.koma_exists(tmp_x, y: tmp_y)) {
            self.scene.masu_arr[tmp_x-1][tmp_y-1].candidate()
        }
    }
    
    func take(koma: Koma) {
        if koma is MikataKoma {
            if (self.teki_koma_exists(koma.x-1, y: koma.y) && self.mikata_koma_exists(koma.x-2, y: koma.y)) {
                self.removeKoma(koma.x-1, y: koma.y, arr: self.scene.teki_koma_arr)
            } else if (self.teki_koma_exists(koma.x+1, y: koma.y) && self.mikata_koma_exists(koma.x+2, y: koma.y)) {
                self.removeKoma(koma.x+1, y: koma.y, arr: self.scene.teki_koma_arr)
            } else if (self.teki_koma_exists(koma.x, y: koma.y-1) && self.mikata_koma_exists(koma.x, y: koma.y-2)) {
                self.removeKoma(koma.x, y: koma.y-1, arr: self.scene.teki_koma_arr)
            } else if (self.teki_koma_exists(koma.x, y: koma.y+1) && self.mikata_koma_exists(koma.x, y: koma.y+2)) {
                self.removeKoma(koma.x, y: koma.y+1, arr: self.scene.teki_koma_arr)
            }
        } else {
            if (self.mikata_koma_exists(koma.x-1, y: koma.y) && self.teki_koma_exists(koma.x-2, y: koma.y)) {
                self.removeKoma(koma.x-1, y: koma.y, arr: self.scene.mikata_koma_arr)
            } else if (self.mikata_koma_exists(koma.x+1, y: koma.y) && self.teki_koma_exists(koma.x+2, y: koma.y)) {
                self.removeKoma(koma.x+1, y: koma.y, arr: self.scene.mikata_koma_arr)
            } else if (self.mikata_koma_exists(koma.x, y: koma.y-1) && self.teki_koma_exists(koma.x, y: koma.y-2)) {
                self.removeKoma(koma.x, y: koma.y-1, arr: self.scene.mikata_koma_arr)
            } else if (self.mikata_koma_exists(koma.x, y: koma.y+1) && self.teki_koma_exists(koma.x, y: koma.y+2)) {
                self.removeKoma(koma.x, y: koma.y+1, arr: self.scene.mikata_koma_arr)
            }
        }
    }
    
    func removeKoma(x: Int, y: Int, arr: [Koma]) {
        for i in 0...(arr.count - 1) {
            if (arr[i].x == x && arr[i].y == y) {
//                arr.removeAtIndex(i)
                arr[i].movedOut()
            }
        }
    }
    
    func koma_exists(x: Int, y: Int) -> Bool {
        if (!(1 <= x && x <= 9 && 1 <= y && y <= 9)) {return false}
        for koma in self.scene.mikata_koma_arr {
            if (koma.x == x && koma.y == y) {return true}
        }
        for koma in self.scene.teki_koma_arr {
            if (koma.x == x && koma.y == y) {return true}
        }
        return false
    }
    
    func mikata_koma_exists(x: Int, y: Int) -> Bool {
        if (!(1 <= x && x <= 9 && 1 <= y && y <= 9)) {return false}
        for koma in self.scene.mikata_koma_arr {
            if (koma.x == x && koma.y == y) {return true}
        }
        return false
    }
    
    func teki_koma_exists(x: Int, y: Int) -> Bool {
        if (!(1 <= x && x <= 9 && 1 <= y && y <= 9)) {return false}
        for koma in self.scene.teki_koma_arr {
            if (koma.x == x && koma.y == y) {return true}
        }
        return false
    }
    
    func clearAllMasu() {
        for arr in self.scene.masu_arr {
            for masu in arr {
                masu.cancel_candidate()
            }
        }
    }
}
