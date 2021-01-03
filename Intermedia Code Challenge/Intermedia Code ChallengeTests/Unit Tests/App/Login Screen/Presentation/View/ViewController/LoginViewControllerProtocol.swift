//
//  LoginViewControllerProtocol.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class LoginViewControllerProtocolTest: XCTest {
    var spy: LoginSpy!

    override func tearDown() {
        super.tearDown()
        spy = nil
    }

    func testSetupView() {
        //given
        spy = LoginSpy()
        spy.setupView()
        //verify
        XCTAssertTrue(spy.invokedSetupView)
        XCTAssertEqual(spy.invokedSetupViewCount, 1)
    }
}
