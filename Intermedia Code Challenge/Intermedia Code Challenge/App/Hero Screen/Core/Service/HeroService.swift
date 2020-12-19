//
//  HeroService.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 17/12/2020.
//

import Foundation
import RxSwift

class HeroService: HeroServiceProtocol {
    private let repository: HeroRepository

    init(repository: HeroRepository) {
        self.repository = repository
    }

    func execute() -> Observable<HeroResponseModel> {
        return repository.getHeroes()
    }
}
//
//extension String {
//    func getCompleteUrl(baseURL: String) -> String {
//
//        let completeURL = appendQueryParams(baseURL: baseURL)
//
//        return completeURL
//    }
//
//    func appendQueryParams(baseURL: String) -> String {
//        var apiPubKey: String = ""
//        var hash: String = ""
//
//        apiPubKey = apiPubKey.getAPIKey(key: NetworkingConstants.publicKey)
//        hash = hash.getAPIKey(key: NetworkingConstants.hash)
//
//        let completeURL = baseURL +
//            "apikey=" + apiPubKey +
//            "hash=" + hash +
//            "ts=" + "1" +
//            "limit=" + "10"
//
//        return completeURL
//    }
//}
