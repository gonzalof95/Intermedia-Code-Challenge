//
//  HeroServiceProtocolMock.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 03/01/2021.
//

import RxSwift
@testable import Intermedia_Code_Challenge

final class HeroServiceProtocolMock: HeroServiceProtocol {
    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: Int?
    var stubbedExecuteResult: Observable<HeroResponseModel>!

    func execute(_ offset: Int) -> Observable<HeroResponseModel> {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = offset

        let mock = HeroRepositoryProtocolMock()
        stubbedExecuteResult = mock.getHeroes(offset)

        return stubbedExecuteResult
    }
}
