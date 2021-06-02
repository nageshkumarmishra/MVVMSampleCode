//
//  TradingCardTests.swift
//  TradingCardTests
//
//  Created by Nagesh Kumar Mishra on 31/05/21.
//

import XCTest
@testable import TradingCard

class TradingCardTests: XCTestCase {
    
    let cardModel =  CardsViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        cardModel.fetchData()
        cardModel.bindViewModelToController = {
            guard let cards = self.cardModel.dataFeed?.cards else {
                return
            }
            XCTAssertTrue(cards.count > 0)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
