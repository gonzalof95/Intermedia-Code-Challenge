//
//  HeroRepositorySpy.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import RxSwift
@testable import Intermedia_Code_Challenge

final class HeroRepositoryProtocolSpy: HeroRepositoryProtocol {

    var invokedGetHeroes = false
    var invokedGetHeroesCount = 0
    var invokedGetHeroesParameters: Int?
    var invokedGetHeroesParametersList = [(offset: Int, Void)]()
    var stubbedGetHeroesResult: Observable<HeroResponseModel>!

    func getHeroes(_ offset: Int) -> Observable<HeroResponseModel> {
        invokedGetHeroes = true
        invokedGetHeroesCount += 1
        invokedGetHeroesParameters = offset
        invokedGetHeroesParametersList.append((offset, ()))

        let mock = HeroMockModel()
        stubbedGetHeroesResult = mock.getMock()

        return stubbedGetHeroesResult
    }
}
