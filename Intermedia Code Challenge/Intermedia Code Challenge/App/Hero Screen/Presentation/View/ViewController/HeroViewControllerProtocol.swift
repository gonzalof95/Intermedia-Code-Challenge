//
//  HeroViewControllerProtocol.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

protocol HeroViewControllerProtocol: BaseViewControllerProtocol {
    func setupView(_ heroes: [HeroModel])
    func reloadTable(_ heroes: [HeroModel])
}
