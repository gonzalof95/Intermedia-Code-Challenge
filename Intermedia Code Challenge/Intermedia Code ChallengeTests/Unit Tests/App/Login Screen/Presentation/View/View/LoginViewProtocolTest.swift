//
//  LoginViewProtocolTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class LoginViewProtocolTest: XCTestCase {
    var mock: LoginViewProtocolMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testAccesButtonTapped() {
        givenMock()
        whenAccessButtonTapped()
        assertTestAccessButtonTapped()
    }

    func testRegisterButtonTapped() {
        givenMock()
        whenRegisterButtonTapped()
        assertTestRegisterButtonTapped()
    }
}

private extension LoginViewProtocolTest {
    func givenMock() {
        mock = LoginViewProtocolMock()
    }

    func whenAccessButtonTapped() {
        mock.accessButtonTapped()
    }

    func whenRegisterButtonTapped() {
        mock.registerButtonTapped()
    }

    func assertTestAccessButtonTapped() {
        XCTAssertTrue(mock.invokedAccessButtonTapped)
        XCTAssertEqual(mock.invokedAccessButtonTappedCount, 1)
    }

    func assertTestRegisterButtonTapped() {
        XCTAssertTrue(mock.invokedRegisterButtonTapped)
        XCTAssertEqual(mock.invokedRegisterButtonTappedCount, 1)
    }
}
