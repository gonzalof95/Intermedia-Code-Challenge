//
//  DetailPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 19/12/2020.
//

import Foundation
import RxSwift

class DetailPresenter {
    weak var delegate: DetailViewControllerProtocol?
    private let disposebag = DisposeBag()
    private let service: ComicsService
    var comicsList: [ComicsModel] = []
    let hero: HeroModel
    var apiCalling = false
    var timesRecalled = 0
    var limit = 0

    init(hero: HeroModel, service: ComicsService) {
        self.hero = hero
        self.service = service
    }

    func viewLoaded() {
        executeGet()
    }

    private func executeGet(offset: Int = 0, isReloadingData: Bool = false) {
        service.execute(offset, hero.id)
            .subscribe(onNext: { [weak self] response in
                self?.limit = response.data.limit
                self?.comicsList = response.data.results
                DispatchQueue.main.async {
                    self?.successFetchComics(isReloadingData)
                }
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposebag)
    }

    private func successFetchComics(_ isReloading: Bool) {
        if !isReloading {
            delegate?.setupView(hero, comicsList)
        } else {
            delegate?.reloadTable(comicsList)
        }
    }

    func requestMoreData(_ isApiCalling: Bool , _ timesRecalled: Int, _ isReloadingData: Bool) {
        if !isApiCalling && (timesRecalled * 15) < limit {
            apiCalling = true
            self.timesRecalled += 1
            executeGet(offset: self.timesRecalled * 15, isReloadingData: isReloadingData)
        }
    }
}
