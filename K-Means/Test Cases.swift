//
//  Test Cases.swift
//  K-Means
//
//  Created by Justin Purnell on 9/26/16.
//  Copyright © 2016 Justin Purnell. All rights reserved.
//

import Foundation

func testSmall_2D() {
    let points = genPoints(numPoints: 21, numDimensions: 2)
    
    print("\nCenters")
    let kmm = KMeans<Character>(labels: ["A", "B", "C", "D", "E", "F"])
    kmm.trainCenters(points: points, convergeDistance: 0.01)
    
    for (label, centroid) in zip(kmm.labels, kmm.centroids) {
		print("Centers: \(label): \(centroid)")
    }
    
    print("\nClassifications")
    for (label, point) in zip(kmm.fit(points: points), points) {
        print("\(label): \(point)")
    }
}

func testSmall_10D() {
    let points = genPoints(numPoints: 10, numDimensions: 10)
    
    print("Centers")
//    let kmm = KMeans<String>(labels: ["Funny","Expensive","ok","jokey","goofy","wordplay","pythonic","alright","inexpensive"])
	let kmm = KMeans<String>(labels: ["BBC", "ITV", "C4", "C5", "Returning", "Finished", "Drama", "Comedy", "Factual", "Entertainment", "Reality", "D- Series", "D-Serial", "D- One-off", "D- Crime Procderal", "D- Crime Thriller", "D- Thriller", "D- Comedy Drama", "D- Relationship", "D- Contemporary Lives", "D- Legal", "D- Medical", "D- Factual Based", "D- Adaptation", "D- Period", "D- Period Adaptation", "D- WW2", "D- WW1", "D- Edwardian", "D- Victorian", "D- Georgian", "D- Pre Georgian", "D- Recent Period", "D- Romance", "D- Female Lead", "C- Alternative", "C- Black", "C- Cringe", " C- Mockumentary", "C- Observational", "C- Sitcom", "C- Studio", "C- Single Camera", "C- Comedy- Drama", "C- Sketch", "F- Ob Doc", "F- Celeb Led", "F- Travelog", "F- Crime", "F- History", "F- Nature /Science", "Half Hour", "One Hour", "Two Hour", "1960s", "1970s", "1980's", "1990's", "2000's", "2010's", "David Jason", "Suranne Jones", "Helen Mirren", "Steve Coogan", "Olivia Coleman", "James Corden", "Mitchell and Webb", "Colin Firth", "Maggie Smith", "Hugh Bonneville", "Jenna Coleman", "John Simm", "Andrew Davies", "Julian Fellowes", "Lynda LaPlante", "Chris Chibnall", "Mike Bartlett", "Paul Abbott", "Jimmy McGovern", "Mammoth", "Kudos", "Company", "Carnival", "Baby Cow", "Jane Austen"])
    kmm.trainCenters(points: points, convergeDistance: 0.01)
    for c in kmm.centroids {
        print(c)
    }
    print("\nPoints")
    for (label, point) in zip(kmm.fit(points: points), points) {
        print("\(label): \(point)")
    }
}

func testSmall_3D() {
    let points = genPoints(numPoints: 100, numDimensions: 3)
    
    print("Centers")
    let kmm = KMeans<Int>(labels: [1,2,3])
    kmm.trainCenters(points: points, convergeDistance: 0.01)
    for (label, c) in zip(kmm.labels, kmm.centroids) {
        print("\(label): \(c)")
    }
}

func test(points: Int, dimensions: Int, centroids: Int) {
	let points = genPoints(numPoints: points, numDimensions: dimensions)
	
	print("Centers")
	let kmm = KMeans<Int>(labels: Array(1...centroids))
	kmm.trainCenters(points: points, convergeDistance: 0.01)
	for (label, c) in zip(kmm.labels, kmm.centroids) {
		print("\(label): \(c)")
	}
}

func testSmall_4D() {
	let points = genPoints(numPoints: 100, numDimensions: 4)
	
	print("Centers")
	let kmm = KMeans<Int>(labels: [1,2,3,4])
	kmm.trainCenters(points: points, convergeDistance: 0.01)
	for (label, c) in zip(kmm.labels, kmm.centroids) {
		print("\(label): \(c)")
	}
}

func testLarge_10D() {
    let points = genPoints(numPoints: 10000, numDimensions: 10)
    print("Centers")
    let kmm = KMeans<Character>(labels: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"])
    kmm.trainCenters(points: points, convergeDistance: 0.0001)
    for (label, c) in zip(kmm.labels, kmm.centroids) {
        print("\(label): \(c)")
    }
    
    for (label, point) in zip(kmm.fit(points: points), points) {
        print("\(label): \(point)")
    }
}
