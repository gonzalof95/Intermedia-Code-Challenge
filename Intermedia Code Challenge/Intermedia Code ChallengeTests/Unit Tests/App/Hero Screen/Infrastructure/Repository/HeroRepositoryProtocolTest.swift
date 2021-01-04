//
//  HeroRepositoryProtocolTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class HeroRepositoryProtocoltest: XCTestCase {
    var mock: HeroRepositoryProtocolMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testGetHeroesInvoked() {
        //given
        mock = HeroRepositoryProtocolMock()
        let response = mock.getHeroes(10)
        //verify
        XCTAssertTrue(mock.invokedGetHeroes)
        XCTAssertEqual(mock.invokedGetHeroesCount, 1)
        XCTAssertEqual(mock.invokedGetHeroesParameters, 10)
        XCTAssertNotNil(response)
    }
}
