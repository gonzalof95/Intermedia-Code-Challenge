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
        delegate?.setupView()
    }
}
