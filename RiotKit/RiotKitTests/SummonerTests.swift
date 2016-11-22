//
//  SummonerTests.swift
//  RiotKit
//
//  Created by Grant Douglas on 21/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import XCTest
@testable import RiotKit

class SummonerTests: XCTestCase {
    override func setUp() {
        super.setUp()
        RiotKit.configure(withProxyURL: "singed.riotkit.xyz")
        Configuration.region = "EUW"
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // Test the fetching of the champion list
    func testSummonerNames() {
        let asyncExpectation = expectation(description: "Fetch summoner asynchronously")
        SummonerRequest.getSummoner(usingName: "DracoRenati", withCompletionHandler: { (summoners: [Summoner]) -> Void in
            
            XCTAssertEqual(summoners.count, 1)
            print(summoners)

            asyncExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 60, handler: nil)
    }
}
