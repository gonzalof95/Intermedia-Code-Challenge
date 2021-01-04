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
        givenMock()
        whenShowAnimation()
        assertTestShowAnimation()
    }

    func testHideAnimation() {
        givenMock()
        whenHideAnimation()
        assertTestHideAnimation()
    }

    func testPushNextViewController() {
        givenMock()
        let mockViewController = BaseViewController()
        whenNextViewControllerPushed(mockViewController)
        assertTestNextViewControllerPushed(mockViewController)
    }

    func testShowError() {
        givenMock()
        whenShowError()
        assertWhenShowError()
    }

    func testPresentMainScreen() {
        givenMock()
        whenMainScreenPresenter()
        assertTestPresentMainScreen()
    }
}

private extension BaseViewControllerProtocolTest {
    func givenMock() {
        spy = BaseViewControllerSpy()
    }

    func whenShowAnimation() {
        spy.showAnimation()
    }

    func whenHideAnimation() {
        spy.hideAnimation()
    }

    func whenNextViewControllerPushed(_ mockViewController: BaseViewController) {
        spy.pushNextViewController(mockViewController)
    }

    func whenShowError() {
        spy.showError(message: "Error")
    }

    func whenMainScreenPresenter() {
        spy.presentMainScreen()
    }

    func assertTestShowAnimation() {
        XCTAssertTrue(spy.invokedShowAnimation)
        XCTAssertEqual(spy.invokedShowAnimationCount, 1)
    }

    func assertTestHideAnimation() {
        XCTAssertTrue(spy.invokedHideAnimation)
        XCTAssertEqual(spy.invokedHideAnimationCount, 1)
    }

    func assertTestNextViewControllerPushed(_ mockViewController: BaseViewController) {
        XCTAssertTrue(spy.invokedPushNextViewController)
        XCTAssertEqual(spy.invokedPushNextViewControllerCount, 1)
        XCTAssertEqual(spy.invokedPushNextViewControllerParameters, mockViewController)
    }

    func assertWhenShowError() {
        XCTAssertTrue(spy.invokedShowError)
        XCTAssertEqual(spy.invokedShowErrorCount, 1)
        XCTAssertEqual(spy.invokedShowErrorParameters, "Error")
    }

    func assertTestPresentMainScreen() {
        XCTAssertTrue(spy.invokedPresentMainScreen)
        XCTAssertEqual(spy.invokedPresentMainScreenCount, 1)
    }
}
