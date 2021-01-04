//
//  HeroRepositoryProtocolTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
import RxSwift
@testable import Intermedia_Code_Challenge

final class HeroRepositoryProtocoltest: XCTestCase {
    var mock: HeroRepositoryProtocolMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testGetHeroesInvoked() {
        givenMock()
        let response = mock.getHeroes(10)
        assertGetHeroesInvoked(response: response)
    }
}

private extension HeroRepositoryProtocoltest {
    func givenMock() {
        mock = HeroRepositoryProtocolMock()
    }

    func assertGetHeroesInvoked(response: Observable<HeroResponseModel>) {
        XCTAssertTrue(mock.invokedGetHeroes)
        XCTAssertEqual(mock.invokedGetHeroesCount, 1)
        XCTAssertEqual(mock.invokedGetHeroesParameters, 10)
        XCTAssertNotNil(response)
    }
}
