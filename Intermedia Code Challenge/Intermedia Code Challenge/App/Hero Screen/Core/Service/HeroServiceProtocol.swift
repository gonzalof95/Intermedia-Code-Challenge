//
//  HeroServiceProtocol.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 17/12/2020.
//

import Foundation
import RxSwift

protocol HeroServiceProtocol {
    func execute(_ offset: Int) -> Observable<HeroResponseModel>
}
