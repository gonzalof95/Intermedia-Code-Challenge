//
//  RegisterViewProtocolTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class RegisterviewProtocolTest: XCTestCase {
    var mock: RegisterViewProtocolMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testRegisterButtonTapped() {
        givenMock()
        whenRegisterButtonTapped()
        assertTestRegisterButtonTapped()
    }
}

private extension RegisterviewProtocolTest {
    func givenMock() {
        mock = RegisterViewProtocolMock()
    }

    func whenRegisterButtonTapped() {
        mock.registerButtonTapped()
    }

    func assertTestRegisterButtonTapped() {
        XCTAssertTrue(mock.invokedRegisterButtonTapped)
        XCTAssertEqual(mock.invokedRegisterButtonTappedCount, 1)
    }
}
