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
    
    
    var token = "http://api.vk.com/blank.html#access_token=524c1f441a0f1e0325e1a34220f3929035add91616fed4eb0422c364bc59138c3f67a2e792115aad4257d&expires_in=0&user_id=29338816"
    
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
        
     
        print("Trololo\(audioGetService.getPopularAudioCount("only_eng=1", count: "count=10"))")
        audioGetService.getPopularAudioCount("only_eng=1", count: "count=10");
        photoGetService.getPhotoById1()
    
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
