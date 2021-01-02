//
//  BaseViewControllerProtocolTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class BaseViewControllerProtocolTest: XCTestCase {
    var spy: BaseViewControllerSpy!

    override func tearDown() {
        super.tearDown()
        spy = nil
    }

    func testShowAnimationInvoked() {
        //given
        spy = BaseViewControllerSpy()
        spy.showAnimation()
        //verify
        XCTAssertTrue(spy.invokedShowAnimation)
        XCTAssertEqual(spy.invokedShowAnimationCount, 1)
    }

    func testHideAnimation() {
        //given
        spy = BaseViewControllerSpy()
        spy.hideAnimation()
        //verify
        XCTAssertTrue(spy.invokedHideAnimation)
        XCTAssertEqual(spy.invokedHideAnimationCount, 1)
    }

    func testPushNextViewController() {
        //given
        spy = BaseViewControllerSpy()
        let mockViewController = BaseViewController()
        spy.pushNextViewController(mockViewController)
        //verify
        XCTAssertTrue(spy.invokedPushNextViewController)
        XCTAssertEqual(spy.invokedPushNextViewControllerCount, 1)
        XCTAssertEqual(spy.invokedPushNextViewControllerParameters, mockViewController)
    }

    func testShowError() {
        //given
        spy = BaseViewControllerSpy()
        spy.showError(message: "Error")
        //verify
        XCTAssertTrue(spy.invokedShowError)
        XCTAssertEqual(spy.invokedShowErrorCount, 1)
        XCTAssertEqual(spy.invokedShowErrorParameters, "Error")
    }

    func testPresentMainScreen() {
        //given
        spy = BaseViewControllerSpy()
        spy.presentMainScreen()
        //verify
        XCTAssertTrue(spy.invokedPresentMainScreen)
        XCTAssertEqual(spy.invokedPresentMainScreenCount, 1)
    }
}
