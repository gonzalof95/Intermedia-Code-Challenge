//
//  DetailPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 19/12/2020.
//

import Foundation

class DetailPresenter {
    weak var delegate: DetailViewControllerProtocol?
    let hero: HeroModel

    init(hero: HeroModel) {
        self.hero = hero
    }

    func viewLoaded() {
        delegate?.setupView(hero, hero.comics.comics)
    }
}
