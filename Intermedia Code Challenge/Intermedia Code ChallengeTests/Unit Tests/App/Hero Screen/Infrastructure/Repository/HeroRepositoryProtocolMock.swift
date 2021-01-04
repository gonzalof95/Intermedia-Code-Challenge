//
//  HeroRepositoryProtocolMock.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import RxSwift
@testable import Intermedia_Code_Challenge

class HeroRepositoryProtocolMock: HeroRepositoryProtocol {
    var invokedGetHeroes = false
    var invokedGetHeroesCount = 0
    var invokedGetHeroesParameters: Int?
    var stubbedGetHeroesResult: Observable<HeroResponseModel>!

    func getHeroes(_ offset: Int) -> Observable<HeroResponseModel> {
        invokedGetHeroes = true
        invokedGetHeroesCount += 1
        invokedGetHeroesParameters = offset

        let mockService = NetworkServiceMock()
        stubbedGetHeroesResult = mockService.execute("base/", 0, 10)

        return stubbedGetHeroesResult
    }
}
