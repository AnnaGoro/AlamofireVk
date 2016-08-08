//
//  AlamofirePodsHomeTests.swift
//  AlamofirePodsHomeTests
//
//  Created by Ann Goro on 7/28/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import XCTest


@testable import AlamofirePodsHome

class AlamofirePodsHomeTests: XCTestCase {
    
    var audioGetService = AudioGetService()
    var photoGetService = PhotoGetService()
    var userGetService = UserGetService()
    var videoGetService = VideoGetService()
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print ("filterSecond")
        filterSecond ()
        print ("filterThird")
        filterThird ()
        print ("dictMapFifth")
        dictMapFifth ()
        print ("reduceSix")
        reduceSix ()

  
    
        }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    
    
        }
    
    func filterSecond () {
        let arraySecond : [String] = ["one", "two", "three", "four", "five"]
        let filtered = arraySecond.filter { $0.containsString("t") }
        print (filtered)
        
    }
    
    
    func filterThird () {
        
        let arrayThird: [(String, Int)] = [("Alex",24), ("Bob",45), ("Mike", 12)]
        print (arrayThird.filter({ $0.1 < 25 }))
        
    }
    
    
    func reduceSix () {
        let arrayString = ["one", "two", "three", "four", "five"]
        let result = arrayString.reduce("", combine: {
            if $0.characters.count == 0 {
                return "\($1)"
                
            } else {
                
                return "\($0) - \($1)"
            }
            
            
        })
        
        print (result)
        
    }
    
    func dictMapFifth () {
        
        let dict = ["Alex":24, "Bob":45, "Mike":12]
        let res = dict.map{ $0.1 + 1 }
        print (res)
        
        
    }

    
    
}
