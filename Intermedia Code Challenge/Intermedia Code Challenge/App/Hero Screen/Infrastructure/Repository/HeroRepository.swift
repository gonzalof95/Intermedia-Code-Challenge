//
//  HeroRepository.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 17/12/2020.
//

import Foundation
import RxSwift

class HeroRepository: HeroRepositoryProtocol {
    private let networkService: NetworkService
    private let url: String

    init(networkService: NetworkService = NetworkService(),
         url: String) {
        self.networkService = networkService
        self.url = url
    }

    func getHeroes() -> Observable<HeroResponseModel> {
        return networkService.execute(baseUrl: url)
    }
}
