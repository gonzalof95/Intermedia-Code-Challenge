//
//  HeroRepositoryProtocol.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 17/12/2020.
//

import Foundation
import RxSwift

protocol HeroRepositoryProtocol {
    func getHeroes() -> Observable<HeroResponseModel>
}
