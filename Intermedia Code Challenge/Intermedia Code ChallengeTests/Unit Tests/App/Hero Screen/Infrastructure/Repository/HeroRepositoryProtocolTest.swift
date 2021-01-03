//
//  HeroRepositoryProtocolTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class HeroRepositoryProtocoltest: XCTestCase {
    var spy: HeroRepositoryProtocolSpy!

    override func tearDown() {
        super.tearDown()
        spy = nil
    }

    func testGetHeroesInvoked() {
        //given
        spy = HeroRepositoryProtocolSpy()
        let response = spy.getHeroes(10)
        //verify
        XCTAssertTrue(spy.invokedGetHeroes)
        XCTAssertEqual(spy.invokedGetHeroesCount, 1)
        XCTAssertEqual(spy.invokedGetHeroesParameters, 10)
        XCTAssertNotNil(response)
    }
}
