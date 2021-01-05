//
//  NetworkServiceMock.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

import Foundation
import RxSwift
@testable import Intermedia_Code_Challenge

final class NetworkServiceMock: NetworkServicePotocol {
    var invokedPublicKeyGetter = false
    var invokedPublicKeyGetterCount = 0
    var stubbedPublicKey: String! = ""

    var publicKey: String {
        invokedPublicKeyGetter = true
        invokedPublicKeyGetterCount += 1
        return stubbedPublicKey
    }

    var invokedHashGetter = false
    var invokedHashGetterCount = 0
    var stubbedHash: String! = ""

    var hash: String {
        invokedHashGetter = true
        invokedHashGetterCount += 1
        return stubbedHash
    }

    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: (baseUrl: String, offset: Int, limit: Int)?

    func execute<T: Decodable>(_ baseUrl: String, _ offset: Int, _ limit: Int) -> Observable<T> {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = (baseUrl, offset, limit)

        return Observable.create { observer -> Disposable in

            if baseUrl == "/hero/" {
                let mock = HeroMockModel()
                let mockResponse = mock.getMockData()
                observer.onNext(mockResponse as! T)
            } else if baseUrl == "/comics/" {
                let mock = ComicsMockModel()
                let mockResponse = mock.getMockData()
                observer.onNext(mockResponse as! T)
            }

            return Disposables.create()
        }
    }

    var invokedAppendQueryParams = false
    var invokedAppendQueryParamsCount = 0
    var invokedAppendQueryParamsParameters: (baseUrl: String, offset: Int, limit: Int)?
    var stubbedAppendQueryParamsResult: String! = ""

    func appendQueryParams(_ baseUrl: String, _ offset: Int, _ limit: Int) -> String {
        invokedAppendQueryParams = true
        invokedAppendQueryParamsCount += 1
        invokedAppendQueryParamsParameters = (baseUrl, offset, limit)
        stubbedAppendQueryParamsResult = baseUrl + "\(offset)/\(limit)"

        return stubbedAppendQueryParamsResult
    }
}
