//
//  NetworkServiceTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

import XCTest
import RxSwift
@testable import Intermedia_Code_Challenge

final class NetworkServiceTest: XCTestCase {
    var mock: NetworkServiceMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testAppendQueryParams() {
        givenMock()
        let result = mock.appendQueryParams("base/", 0, 10)
        assertAppendQueryParams(result)
    }

    func testExecute() {
        givenMock()
        let response = execute()
        assertExecute(response)
    }
}

private extension NetworkServiceTest {
    func givenMock() {
        mock = NetworkServiceMock()
    }

    func assertAppendQueryParams(_ result: String) {
        XCTAssertTrue(mock.invokedAppendQueryParams)
        XCTAssertEqual(mock.invokedAppendQueryParamsCount, 1)
        XCTAssertNotNil(result)
    }

    func execute() -> Observable<HeroResponseModel> {
        return mock.execute("base/", 0, 1)
    }

    func assertExecute(_ response: Observable<HeroResponseModel>) {
        XCTAssertTrue(mock.invokedExecute)
        XCTAssertEqual(mock.invokedExecuteCount, 1)
        XCTAssertNotNil(response)
    }
}
