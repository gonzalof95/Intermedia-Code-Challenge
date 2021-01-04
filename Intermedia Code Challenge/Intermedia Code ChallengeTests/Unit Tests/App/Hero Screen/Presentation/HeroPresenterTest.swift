//
//  HeroPresenterTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 03/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class HeroPresenterTests: XCTestCase {
    var presenter: HeroPresenter!
    var delegate: HeroViewControllerMock!
    var service: HeroServiceProtocolMock!

    override func tearDown() {
        super.tearDown()
        service = nil
        presenter = nil
        delegate = nil
    }

    func testRowTaped() {
        givenMocks()
        whenRowTapped()
        assertTestRowTapped()
    }

    func testViewLoaded() {
        givenMocks()
        whenPresenterLoaded()
        assertTestViewLoaded()
    }

    func testRequestMoreDataNotReloading() {
        givenMocks()
        whenMoreDataRequestedNotReloading()
        assertTestDataRequested()
    }

    func testRequestMoreDataReloading() {
        givenMocks()
        whenMoreDataRequestedReloading()
        assertTestDataRequestedReloading()
    }
}

private extension HeroPresenterTests {
    func givenMocks() {
        service = HeroServiceProtocolMock()
        presenter = HeroPresenter(service: service)
        delegate = HeroViewControllerMock()
        presenter.delegate = delegate
    }

    func whenRowTapped() {
        let thumbnail = ThumbnailModel(path: "", imageExtension: "")
        let hero = HeroModel(id: 1, name: "", description: "", thumbnail: thumbnail)
        presenter.rowTaped(hero: hero)
    }

    func whenPresenterLoaded() {
        presenter.viewLoaded()
    }

    func whenMoreDataRequestedNotReloading() {
        presenter.requestMoreData(false, 1, false)
    }

    func whenMoreDataRequestedReloading() {
        presenter.requestMoreData(false, 1, true)
    }

    func assertTestRowTapped() {
        XCTAssertTrue(delegate.invokedPushNextViewController)
        XCTAssertEqual(delegate.invokedPushNextViewControllerCount, 1)
    }

    func assertTestViewLoaded() {
        XCTAssertNotNil(presenter.heroesList)
        XCTAssertEqual(presenter.heroesList[0].id, 1)
        XCTAssertEqual(presenter.heroesList[0].name, "Hero")
        XCTAssertEqual(presenter.heroesList[0].description, "Description")
        XCTAssertEqual(presenter.heroesList[0].thumbnail.path, "imagepath/")
        XCTAssertEqual(presenter.heroesList[0].thumbnail.imageExtension, ".jpg")
    }

    func assertTestDataRequested() {
        XCTAssertNotNil(presenter.heroesList)
        XCTAssertNotNil(delegate.invokedShowAnimation)
        XCTAssertEqual(delegate.invokedShowAnimationCount, 1)
    }

    func assertTestDataRequestedReloading() {
        XCTAssertNotNil(presenter.heroesList)
        XCTAssertFalse(delegate.invokedShowAnimation)
    }
}
