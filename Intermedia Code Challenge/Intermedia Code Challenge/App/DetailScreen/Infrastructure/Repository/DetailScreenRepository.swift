//
//  DetailScreenRepository.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import Foundation
import RxSwift

class ComicsRepository: ComicsRepositoryProtocol {
    private let networkService: NetworkService
    private let url: String

    init(networkService: NetworkService = NetworkService(), url: String) {
        self.networkService = networkService
        self.url = url
    }

    func getComics(_ offset: Int, _ heroID: Int) -> Observable<ComicsResponseModel> {
        //TODO: cambiar aca por el id posta
        let fullUrl = url + "/1011335/comics"
        return networkService.execute(fullUrl, offset)
    }
}
