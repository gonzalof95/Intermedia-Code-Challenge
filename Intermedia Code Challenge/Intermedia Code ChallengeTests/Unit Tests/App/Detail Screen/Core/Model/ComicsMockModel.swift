//
//  ComicsMockModel.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

import RxSwift
@testable import Intermedia_Code_Challenge

class ComicsMockModel {
    func getMock<T: Decodable>() -> Observable<T> {
        return Observable.create { observer -> Disposable in
            let comicsResponseMock = self.getMockData()
            observer.onNext(comicsResponseMock as! T)

            return Disposables.create()
        }
    }

    func getMockData() -> ComicsResponseModel {
        let comicsMock = ComicsModel(id: 1, title: "title")
        let comicsResponseDataMock = ComicsResponseData(offset: 10, count: 10, results: [comicsMock])
        let comicsResponseMock = ComicsResponseModel(code: 200, data: comicsResponseDataMock)

        return comicsResponseMock
    }
}
