//
//  HeroPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import RxSwift

class HeroPresenter {
    weak var delegate: HeroViewControllerProtocol?
    private let disposebag = DisposeBag()
    private let service: HeroServiceProtocol
    var heroesList: [HeroModel] = []
    var apiCalling = false
    var timesRecalled = 0

    init(service: HeroServiceProtocol) {
        self.service = service
    }

    func viewLoaded() {
        executeGet()
    }

    private func executeGet(offset: Int = 0, isReloadingData: Bool = false) {
        if !isReloadingData {
            delegate?.showAnimation()
        }
        service.execute(offset)
            .subscribe(onNext: { [weak self] response in
                self?.heroesList = response.data.results
                DispatchQueue.main.async {
                    if !isReloadingData {
                        self?.delegate?.hideAnimation()
                    }
                    self?.successFetchHeroes(isReloadingData)
                }
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposebag)
    }

    private func successFetchHeroes(_ isReloading: Bool) {
        if !isReloading {
            delegate?.setupView(heroesList)
        } else {
            delegate?.reloadTable(heroesList)
        }
    }

    func requestMoreData(_ isApiCalling: Bool , _ timesRecalled: Int, _ isReloadingData: Bool) {
        if !isApiCalling {
            apiCalling = true
            self.timesRecalled += 1
            executeGet(offset: self.timesRecalled * 15, isReloadingData: isReloadingData)
        }
    }

    func rowTaped(hero: HeroModel) {
        let presenter = DetailPresenter(hero: hero,
                                        service: ComicsService(repository: ComicsRepository(url: NetworkingConstants.baseURL)))
        delegate?.pushNextViewController(DetailViewController(with: presenter, heroData: hero))
    }
}
