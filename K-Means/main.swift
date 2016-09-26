//
//  main.swift
//  K-Means
//
//  Created by Justin Purnell on 9/26/16.
//  Copyright © 2016 Justin Purnell. All rights reserved.
//

import Foundation

print("Hello, World!")

//let points = genPoints(numPoints: 10, numDimensions: 4)

//Cluster(numCenters: 6, convergeDistance: 1.0, points: points)

func testSmall_2D() {
    let points = genPoints(numPoints: 21, numDimensions: 2)
    
    print("\nCenters")
    let kmm = KMeans<Character>(labels: ["A", "B", "C", "D", "E"])
    kmm.trainCenters(points: points, convergeDistance: 0.01)
    
    for (label, centroid) in zip(kmm.labels, kmm.centroids) {
        print("\(label): \(centroid)")
    }
    
    print("\nClassifications")
    for (label, point) in zip(kmm.fit(points: points), points) {
        print("\(label): \(point)")
    }
}

func testSmall_10D() {
    let points = genPoints(numPoints: 10, numDimensions: 10)
    
    print("\nCenters")
    let kmm = KMeans<Int>(labels: [1,2,3])
    kmm.trainCenters(points: points, convergeDistance: 0.01)
    for c in kmm.centroids {
        print(c)
    }
}

func testSmall_3D() {
    let points = genPoints(numPoints: 10, numDimensions: 3)
    
    print("Centers")
    let kmm = KMeans<Int>(labels: [1,2,3])
    kmm.trainCenters(points: points, convergeDistance: 0.01)
    for (label, c) in zip(kmm.labels, kmm.centroids) {
        print("\(label): \(c)")
    }
}

testSmall_2D()
//testSmall_10D()
//testSmall_3D()
