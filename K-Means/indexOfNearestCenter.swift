//
//  indexOfNearestCenter.swift
//  K-Means
//
//  Created by Justin Purnell on 9/26/16.
//  Copyright © 2016 Justin Purnell. All rights reserved.
//

import Foundation

func indexOfNearestCenter(x: Vector, centers: [Vector]) -> Int {
    var nearestDist = Double.greatestFiniteMagnitude
    var minIndex = 0
    
    for (idx, center) in centers.enumerated() {
        let dist = x.distanceTo(other: center)
        if dist < nearestDist {
            minIndex = idx
            nearestDist = dist
        }
    }
    
    return minIndex
}
