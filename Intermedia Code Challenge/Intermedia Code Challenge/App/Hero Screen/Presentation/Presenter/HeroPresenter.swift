//
//  HeroPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth
import RxSwift
import RxCocoa

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

    private func executeGet() {
        service.execute()
            .subscribe(onNext: { [weak self] response in
                self?.heroesList = response.data.results
                DispatchQueue.main.async {
                    print(self?.heroesList as Any)
                    self?.successFetchHeroes()
                }
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposebag)
    }

    private func successFetchHeroes() {
        delegate?.setupView(heroesList)
    }
}
