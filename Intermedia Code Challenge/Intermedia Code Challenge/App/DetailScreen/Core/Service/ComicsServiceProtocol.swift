//
//  ComicsServiceProtocol.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import Foundation
import RxSwift

protocol ComicsServiceProtocol {
    func execute(_ offset: Int, _ heroID: Int) -> Observable<ComicsResponseModel>
}
