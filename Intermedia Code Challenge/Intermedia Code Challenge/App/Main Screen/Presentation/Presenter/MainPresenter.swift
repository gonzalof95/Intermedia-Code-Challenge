//
//  MainPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth

class MainPresenter {
    weak var delegate: MainViewControllerProtocol?

    func viewLoaded() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let presenter = LoginPresenter()
                let viewController = LoginViewController(with: presenter)
                self.delegate?.pushNextViewController(viewController)
            }
        } else {
            delegate?.setupView()
        }
    }
}
