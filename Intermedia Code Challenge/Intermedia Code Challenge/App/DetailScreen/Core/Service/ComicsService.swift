//
//  ComicsService.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import Foundation
import RxSwift

class ComicsService: ComicsServiceProtocol {
    private let repository: ComicsRepository

    init(repository: ComicsRepository) {
        self.repository = repository
    }

    func execute(_ offset: Int, _ heroID: Int) -> Observable<ComicsResponseModel> {
        return repository.getComics(offset, heroID)
    }
}
