//
//  HeroService.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 17/12/2020.
//

import Foundation
import RxSwift

class HeroService: HeroServiceProtocol {
    private let repository: HeroRepositoryProtocol

    init(repository: HeroRepositoryProtocol) {
        self.repository = repository
    }

    func execute(_ offset: Int) -> Observable<HeroResponseModel> {
        return repository.getHeroes(offset)
    }
}
