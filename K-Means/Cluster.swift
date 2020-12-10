//
//  Cluster.swift
//  K-Means
//  Created by Justin Purnell on 9/26/16.
//  Copyright © 2016 Justin Purnell. All rights reserved.

import Foundation

func Cluster(numCenters: Int, convergeDistance: Double, points: [Vector]) -> [Vector]  {
    var centers = reservoirSample(samples: points, k: numCenters)
    
    var centerMoveDist = 0.0
    repeat {
        let zeros = [Double](repeating: 0, count: points[0].length)
        var newCenters = [Vector](repeating: Vector(zeros), count: numCenters)
        
        var counts = [Double](repeating: 0, count: numCenters)
        
        for p in points {
            let c = indexOfNearestCenter(x: p, centers: centers)
            newCenters[c] += p
            counts[c] += 1
        }
        
        for idx in 0..<numCenters {
            newCenters[idx] /= counts[idx]
        }
        
        centerMoveDist = 0.0
        for idx in 0..<numCenters {
            centerMoveDist += centers[idx].distanceTo(other: newCenters[idx])
        }
        
        centers = newCenters
    } while centerMoveDist > convergeDistance
    
    return centers
}
