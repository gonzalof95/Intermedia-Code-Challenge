//
//  EventsScreenRepositoryProtocol.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import Foundation
import RxSwift

protocol EventsRepositoryProtocol {
    func getEvents() -> Observable<EventsResponseModel>
}
