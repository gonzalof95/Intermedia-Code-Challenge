//
//  HeroMockModel.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

import RxSwift
@testable import Intermedia_Code_Challenge

class HeroMockModel {
    func getMock<T: Decodable>() -> Observable<T> {
        return Observable.create { observer -> Disposable in
            let heroResponseMock = self.getMockData()
            observer.onNext(heroResponseMock as! T)

            return Disposables.create()
        }
    }

    func getMockData() -> HeroResponseModel {
        let thumbnailMock = ThumbnailModel(path: "imagepath/", imageExtension: ".jpg")
        let heroMock = HeroModel(id: 1, name: "Hero", description:
                                     "Description", thumbnail: thumbnailMock)
        let heroResponseDataMock = HeroResponseData(offset: 1, limit: 10, count: 20, results: [heroMock])
        let heroResponseMock = HeroResponseModel(code: 200, data: heroResponseDataMock)

        return heroResponseMock
    }
}
