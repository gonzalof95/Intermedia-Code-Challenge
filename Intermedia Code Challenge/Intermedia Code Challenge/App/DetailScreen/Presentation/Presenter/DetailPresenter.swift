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

    init(hero: HeroModel, service: ComicsService) {
        self.hero = hero
        self.service = service
    }

    func viewLoaded() {
        executeGet()
    }

    private func executeGet() {
        service.execute(0, hero.id)
            .subscribe(onNext: { [weak self] response in
                self?.comicsList = response.data.results
                DispatchQueue.main.async {
                    self?.successFetchComics()
                }
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposebag)
    }

    private func successFetchComics() {
        delegate?.setupView(hero, comicsList)
    }
}
