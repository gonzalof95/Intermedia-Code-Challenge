//
//  ComicsRepositoryProtocolTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

import XCTest
import RxSwift
@testable import Intermedia_Code_Challenge

final class ComicsRepositoryProtocolTest: XCTestCase {
    var mock: ComicsRepositoryProtocolMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testGetComicsInvoked() {
        givenMock()
        let response = mock.getComics(10, 1)
        assertGetComicsInvoked(response)
    }
}

private extension ComicsRepositoryProtocolTest {
    func givenMock() {
        mock = ComicsRepositoryProtocolMock()
    }

    func assertGetComicsInvoked(_ response: Observable<ComicsResponseModel>) {
        XCTAssertTrue(mock.invokedGetComics)
        XCTAssertEqual(mock.invokedGetComicsCount, 1)
        XCTAssertNotNil(response)
    }
}
