//
//  HeroPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth
import RxSwift

class HeroPresenter {
    weak var delegate: HeroViewControllerProtocol?
    private let disposebag = DisposeBag()
    private let service: HeroService
    private var heroesList: [HeroModel] = []

    init(service: HeroService) {
        self.service = service
    }

    func viewLoaded() {
        executeGet()
    }

    private func executeGet(offset: Int = 0, isReloadingData: Bool = false) {
        service.execute(offset)
            .subscribe(onNext: { [weak self] response in
                self?.heroesList = response.data.results
                DispatchQueue.main.async {
                    print(self?.heroesList as Any)
                    self?.successFetchHeroes(isReloadingData)
                }
            }, onError: { error in
                print(error)
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

    func requestMoreData(_ offset: Int, _ isReloadingData: Bool) {
        executeGet(offset: offset, isReloadingData: isReloadingData)
    }
}
