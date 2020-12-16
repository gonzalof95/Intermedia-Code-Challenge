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

    required init(_ client: NetworkingClient) {
        self.client = client
    }

    func viewLoaded() {
        delegate?.setupView()
        client.executeGetToken { (result) in
            switch result {
            case .success(_):
                print("success")
            case .failure(let error):
                print(error)
            }
        }
    }
}
