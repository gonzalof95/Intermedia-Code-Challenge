//
//  StoriesServiceProtocol.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import Foundation
import RxSwift

protocol StoriesServiceProtocol {
    func execute() -> Observable<EventsResponseModel>
}
