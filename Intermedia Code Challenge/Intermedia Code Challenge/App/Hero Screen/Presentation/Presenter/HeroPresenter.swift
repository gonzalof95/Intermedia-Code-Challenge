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
    let client: NetworkingClient
    var heroesList: [HeroModel] = []

    private let repository = HeroRepository()
    private let disposebag = DisposeBag()

    required init(_ client: NetworkingClient) {
        self.client = client
    }

    func viewLoaded() {
        executeGet()
    }

    private func executeGet() {
        repository.getHeroes()
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
