//
//  Coordinate.swift
//  HasamiShogi
//
//  Created by Takayuki Sakai on 2/7/15.
//  Copyright (c) 2015 Takayuki Sasai. All rights reserved.
//

import SpriteKit

class Coordinate {
    var x_cen:CGFloat
    var y_cen:CGFloat
    var width:CGFloat
    var height:CGFloat
    
    init(x_cen: CGFloat, y_cen: CGFloat, width: CGFloat, height: CGFloat) {
        self.x_cen = x_cen
        self.y_cen = y_cen
        self.width = width
        self.height = height
    }
    
    func getRawCoodinate(x: Int, y: Int) -> (x: CGFloat!, y: CGFloat!){
        return (x_cen + CGFloat((x-5) * -1) * width, y_cen + CGFloat((y-5) * -1) * height)
    }
}
