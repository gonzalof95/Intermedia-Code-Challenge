//
//  LoginViewControllerProtocol.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class LoginViewControllerProtocolTest: XCTestCase {
    var spy: LoginSpy!

    override func tearDown() {
        super.tearDown()
        spy = nil
    }

    func testSetupView() {
        givenMock()
        whenTappedButton()
        assertTestSetupView()
    }
}

private extension LoginViewControllerProtocolTest {
    func givenMock() {
        spy = LoginSpy()
    }

    func whenTappedButton() {
        spy.setupView()
    }

    func assertTestSetupView() {
        XCTAssertTrue(spy.invokedSetupView)
        XCTAssertEqual(spy.invokedSetupViewCount, 1)
    }
}
