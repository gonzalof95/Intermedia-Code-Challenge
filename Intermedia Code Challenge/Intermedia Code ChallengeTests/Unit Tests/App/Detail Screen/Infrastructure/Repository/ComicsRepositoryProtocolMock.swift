//
//  ComicsRepositoryProtocolMock.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

import RxSwift
@testable import Intermedia_Code_Challenge

final class ComicsRepositoryProtocolMock: ComicsRepositoryProtocol {

    var invokedGetComics = false
    var invokedGetComicsCount = 0
    var invokedGetComicsParameters: (offset: Int, heroID: Int)?
    var stubbedGetComicsResult: Observable<ComicsResponseModel>!

    func getComics(_ offset: Int, _ heroID: Int) -> Observable<ComicsResponseModel> {
        invokedGetComics = true
        invokedGetComicsCount += 1
        invokedGetComicsParameters = (offset, heroID)

        let mock = ComicsMockModel()
        stubbedGetComicsResult = mock.getMock()

        return stubbedGetComicsResult
    }
}
