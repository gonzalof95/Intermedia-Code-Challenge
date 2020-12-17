//
//  HeroRepository.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 17/12/2020.
//

import Foundation
import RxSwift

class HeroRepository {
    private let networkService = NetworkService()
    let newUrl = URL(string: "https://gateway.marvel.com/v1/public/characters?apikey=3a783b25c80e1c44875356dd363f272d&hash=51a3ecf2f92a23817992a2663183325e&ts=1&offset=10&limit=10")!

    func getHeroes() -> Observable<HeroResponseModel> {
        return networkService.execute(url: newUrl)
    }
}
