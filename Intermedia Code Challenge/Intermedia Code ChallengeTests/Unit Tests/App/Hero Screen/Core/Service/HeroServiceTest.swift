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

    func testGetHeroresSuccess() {
        repository.getHeroes(10).subscribe(onNext: { [weak self] response in
            self?.heroData = response.data.results
        })
        .disposed(by: disposeBag)

        XCTAssertNotNil(heroData)
    }

    func testExecuteInvoked() {
        //given
        mock = HeroServiceProtocolMock()
        let response = mock.execute(10)
        //verify
        XCTAssertTrue(mock.invokedExecute)
        XCTAssertEqual(mock.invokedExecuteCount, 1)
        XCTAssertEqual(mock.invokedExecuteParameters, 10)
        XCTAssertNotNil(response)
    }
}
