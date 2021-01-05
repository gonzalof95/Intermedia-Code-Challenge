//
//  ComicsServiceProtocolMock.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

import RxSwift
@testable import Intermedia_Code_Challenge

final class ComicsServiceProtocolMock: ComicsServiceProtocol {
    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: (offset: Int, heroID: Int)?
    var stubbedExecuteResult: Observable<ComicsResponseModel>!

    func execute(_ offset: Int, _ heroID: Int) -> Observable<ComicsResponseModel> {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = (offset, heroID)

        let mock = ComicsRepositoryProtocolMock()
        stubbedExecuteResult = mock.getComics(1, 1)

        return stubbedExecuteResult
    }
}
