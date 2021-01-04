//
//  LoginViewProtocolTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class LoginViewProtocolTest: XCTestCase {
    var spy: LoginViewSpy!

    override func tearDown() {
        super.tearDown()
        spy = nil
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
        spy = LoginViewSpy()
    }

    func whenAccessButtonTapped() {
        spy.accessButtonTapped()
    }

    func whenRegisterButtonTapped() {
        spy.registerButtonTapped()
    }

    func assertTestAccessButtonTapped() {
        XCTAssertTrue(spy.invokedAccessButtonTapped)
        XCTAssertEqual(spy.invokedAccessButtonTappedCount, 1)
    }

    func assertTestRegisterButtonTapped() {
        XCTAssertTrue(spy.invokedRegisterButtonTapped)
        XCTAssertEqual(spy.invokedRegisterButtonTappedCount, 1)
    }
}
