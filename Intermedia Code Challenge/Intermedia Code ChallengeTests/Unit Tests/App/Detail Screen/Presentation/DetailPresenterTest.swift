//
//  DetailPresenterTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

import XCTest
@testable import Intermedia_Code_Challenge

final class DetailPresenterTest: XCTestCase {
    var presenter: DetailPresenter!
    var delegate: DetailViewControllerMock!
    var service: ComicsServiceProtocolMock!

    override func tearDown() {
        super.tearDown()
        service = nil
        presenter = nil
        delegate = nil
    }

    func testViewLoaded() {
        givenMocks()
        whenPresenterLoaded()
        assertTestViewLoaded()
    }

    func testRequestMoreData() {
        givenMocks()
        whenMoreDataRequested()
        assertMoreDataRequested()
    }

    func testRequestMoreDataOutOfLimit() {
        givenMocks()
        whenMoreDataRequestedOutOfLimit()
    }
}

private extension DetailPresenterTest {
    func givenMocks() {
        service = ComicsServiceProtocolMock()
        let thumbnail = ThumbnailModel(path: "path/", imageExtension: ".jpg")
        let hero = HeroModel(id: 1, name: "hero", description: "description", thumbnail: thumbnail)
        presenter = DetailPresenter(hero: hero, service: service)
        delegate = DetailViewControllerMock()
        presenter.delegate = delegate
    }

    func whenPresenterLoaded() {
        presenter.viewLoaded()
    }

    func whenMoreDataRequested() {
        presenter.requestMoreData(false, 1, false)
    }

    func whenMoreDataRequestedOutOfLimit() {
        presenter.requestMoreData(false, 500, false)
    }

    func assertTestViewLoaded() {
        XCTAssertNotNil(presenter.comicsList)
    }

    func assertMoreDataRequested() {
        XCTAssertNotNil(presenter.comicsList)
    }

    func assertMoreDataRequestedOutOfLimit() {
        XCTAssertNil(presenter.comicsList)
    }
}
