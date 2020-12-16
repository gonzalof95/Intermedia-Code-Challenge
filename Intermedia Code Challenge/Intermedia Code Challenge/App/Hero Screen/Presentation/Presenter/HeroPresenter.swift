//
//  HeroPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth

class HeroPresenter {
    weak var delegate: HeroViewControllerProtocol?
    let client: NetworkingClient
    var heroesList: [HeroModel] = []

    required init(_ client: NetworkingClient) {
        self.client = client
    }

    func viewLoaded() {
        client.executeGetToken { (result) in
            switch result {
            case .success(let response):
                self.heroesList = response.responseData.results
                DispatchQueue.main.async {
                    print(self.heroesList)
                    self.delegate?.setupView(self.heroesList)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
