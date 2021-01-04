//
//  HeroServiceTest.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import Foundation
import XCTest
import RxSwift
import RxTest
@testable import Intermedia_Code_Challenge

class HeroServiceTest: XCTestCase {
    var repository: HeroRepositoryProtocolMock!
    var mock: HeroServiceProtocolMock!
    var disposeBag: DisposeBag!
    var heroData: [HeroModel] = []

    override func setUp() {
        super.setUp()
        repository = HeroRepositoryProtocolMock()
        disposeBag = DisposeBag()
        mock = nil
    }

    func testGetHeroesSuccess() {
        whenGetHeroes()
        assertGetHeores()
    }

    func testExecuteInvoked() {
        givenMock()
        let response = mock.execute(10)
        assertTestGetHeroes(response: response)
    }
}

private extension HeroServiceTest {
    func givenMock() {
        mock = HeroServiceProtocolMock()
    }

    func whenGetHeroes() {
        repository.getHeroes(10).subscribe(onNext: { [weak self] response in
            self?.heroData = response.data.results
        })
        .disposed(by: disposeBag)
    }

    func assertGetHeores() {
        XCTAssertNotNil(heroData)
    }

    func assertTestGetHeroes(response: Observable<HeroResponseModel>) {
        XCTAssertTrue(mock.invokedExecute)
        XCTAssertEqual(mock.invokedExecuteCount, 1)
        XCTAssertEqual(mock.invokedExecuteParameters, 10)
        XCTAssertNotNil(response)
    }
}
