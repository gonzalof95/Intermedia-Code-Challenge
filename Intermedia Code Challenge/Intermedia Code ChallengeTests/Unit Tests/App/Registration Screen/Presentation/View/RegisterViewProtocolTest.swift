//
//  RegisterViewProtocolTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class RegisterviewProtocolTest: XCTestCase {
    var spy: RegisterViewSpy!

    override func tearDown() {
        super.tearDown()
        spy = nil
    }

    func testRegisterButtonTapped() {
        //given
        spy = RegisterViewSpy()
        spy.registerButtonTapped()
        //verify
        XCTAssertTrue(spy.invokedRegisterButtonTapped)
        XCTAssertEqual(spy.invokedRegisterButtonTappedCount, 1)
    }
}
