//
//  LoginViewControllerProtocol.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class LoginViewControllerProtocolTest: XCTestCase {
    var mock: LoginViewControllerProtocolMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testSetupView() {
        givenMock()
        whenTappedButton()
        assertTestSetupView()
    }
}

private extension LoginViewControllerProtocolTest {
    func givenMock() {
        mock = LoginViewControllerProtocolMock()
    }

    func whenTappedButton() {
        mock.setupView()
    }

    func assertTestSetupView() {
        XCTAssertTrue(mock.invokedSetupView)
        XCTAssertEqual(mock.invokedSetupViewCount, 1)
    }
}
