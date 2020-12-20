//
//  EventsScreenRepository.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import Foundation
import RxSwift

class EventsRepository: EventsRepositoryProtocol {
    private let networkService: NetworkService
    private let url: String

    init(networkService: NetworkService = NetworkService(), url: String) {
        self.networkService = networkService
        self.url = url
    }

    func getEvents() -> Observable<EventsResponseModel> {
        let fullUrl = url + "events"
        return networkService.execute(fullUrl, 0, NetworkingConstants.eventLimit)
    }
}
