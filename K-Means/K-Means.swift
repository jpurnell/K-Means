//
//  K-Means.swift
//  K-Means
//
//  Created by Justin Purnell on 9/26/16.
//  Copyright © 2016 Justin Purnell. All rights reserved.
//

import Foundation

class KMeans<Label: Hashable> {
    let numCenters: Int
    let labels: [Label]
    private(set) var centroids = [Vector]()
    
    init(labels: [Label]) {
        assert(labels.count > 1, "Exception: K-Means with less than 2 centers.")
        self.labels = labels
        self.numCenters = labels.count
    }
    
   
    func trainCenters(points: [Vector], convergeDistance: Double) {
        let zeroVector = Vector([Double](repeating: 0, count: points[0].length))
        
        var centers = reservoirSample(samples: points, k: numCenters)
        
        var centerMoveDist = 0.0
        
        repeat {
            var classification: [[Vector]] = Array.init(repeating: [], count: numCenters)
            
            for p in points {
                let classIndex = indexOfNearestCenter(x: p, centers: centers)
                classification[classIndex].append(p)
            }
            
            let newCenters = classification.map { assignedPoints in
                assignedPoints.reduce(zeroVector, +)/Double(assignedPoints.count)
            }
            
            centerMoveDist = 0.0
            for idx in 0..<numCenters {
                centerMoveDist += centers[idx].distanceTo(other: newCenters[idx])
            }
            
            centers = newCenters
        } while centerMoveDist > convergeDistance
        
        centroids = centers
    }
    
    func fit(point: Vector) -> Label {
        assert(!centroids.isEmpty, "Exception: K-Means tried to fit on a non-trained model.")
        
        let centroidIndex = indexOfNearestCenter(x: point, centers: centroids)
        return labels[centroidIndex]
    }
    
    func fit(points: [Vector]) -> [Label] {
        assert(!centroids.isEmpty, "Exception: K-Means tried to fit on a non-trained model.")
        
        return points.map(fit)
    }
}

func reservoirSample<T>(samples: [T], k: Int) -> [T] {
    var result = [T]()
    
    for i in 0..<k {
        result.append(samples[i])
    }
    
    for i in k..<samples.count {
        let j = Int(arc4random_uniform(UInt32(i + 1)))
        if j < k {
            result[j] = samples[i]
        }
    }
    
    return result
}
