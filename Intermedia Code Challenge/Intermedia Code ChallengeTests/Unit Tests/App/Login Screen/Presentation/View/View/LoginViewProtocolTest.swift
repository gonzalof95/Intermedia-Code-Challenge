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
        //given
        spy = LoginViewSpy()
        spy.accessButtonTapped()
        //verify
        XCTAssertTrue(spy.invokedAccessButtonTapped)
        XCTAssertEqual(spy.invokedAccessButtonTappedCount, 1)
    }

    func testRegisterButtonTapped() {
        //given
        spy = LoginViewSpy()
        spy.registerButtonTapped()
        //verify
        XCTAssertTrue(spy.invokedRegisterButtonTapped)
        XCTAssertEqual(spy.invokedRegisterButtonTappedCount, 1)
    }
}
