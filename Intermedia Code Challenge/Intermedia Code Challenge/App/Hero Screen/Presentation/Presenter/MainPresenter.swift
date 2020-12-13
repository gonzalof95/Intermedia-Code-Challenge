//
//  HeroPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth

class HeroPresenter {
    weak var delegate: HeroViewControllerProtocol?

    func viewLoaded() {
        delegate?.setupView()
    }
}
