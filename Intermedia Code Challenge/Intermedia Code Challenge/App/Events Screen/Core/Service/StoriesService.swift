//
//  StoriesService.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import Foundation
import RxSwift

class StoriesService: StoriesServiceProtocol {
    private let repository: EventsRepository

    init(repository: EventsRepository) {
        self.repository = repository
    }

    func execute() -> Observable<EventsResponseModel> {
        return repository.getEvents()
    }
}
