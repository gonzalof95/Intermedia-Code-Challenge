//
//  ComicsServiceTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

import Foundation
import XCTest
import RxSwift
import RxTest
@testable import Intermedia_Code_Challenge

class ComicsServiceTest: XCTestCase {
    var repository: ComicsRepositoryProtocolMock!
    var mock: ComicsServiceProtocolMock!
    var disposeBag: DisposeBag!
    var comicsData: [ComicsModel] = []

    override func setUp() {
        super.setUp()
        repository = ComicsRepositoryProtocolMock()
        disposeBag = DisposeBag()
        mock = nil
    }

    func testGetComics() {
        whenGetComics()
        assertGetComics()
    }

    func testExecuteInvoked() {
        givenMock()
        let response = mock.execute(0, 1)
        assertExecute(response)
    }
}

private extension ComicsServiceTest {
    func givenMock() {
        mock = ComicsServiceProtocolMock()
    }

    func whenGetComics() {
        repository.getComics(0, 10).subscribe(onNext: { [weak self] response in
            self?.comicsData = response.data.results
        })
        .disposed(by: disposeBag)
    }

    func assertGetComics() {
        XCTAssertNotNil(comicsData)
        XCTAssertEqual(comicsData[0].id, 1)
        XCTAssertEqual(comicsData[0].title, "title")
    }

    func assertExecute(_ response: Observable<ComicsResponseModel>) {
        XCTAssertTrue(mock.invokedExecute)
        XCTAssertEqual(mock.invokedExecuteCount, 1)
        XCTAssertNotNil(response)
    }
}
