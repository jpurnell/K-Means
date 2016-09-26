//
//  GenPoints.swift
//  K-Means
//
//  Created by Justin Purnell on 9/26/16.
//  Copyright © 2016 Justin Purnell. All rights reserved.
//

import Foundation
func genPoints(numPoints: Int, numDimensions: Int) -> [Vector] {
    var points = [Vector]()
    for _ in 0..<numPoints {
        var data = [Double]()
        for _ in 0..<numDimensions {
            data.append(Double(arc4random_uniform(UInt32(numPoints*numDimensions))))
        }
        points.append(Vector(data))
    }
    return points
}

