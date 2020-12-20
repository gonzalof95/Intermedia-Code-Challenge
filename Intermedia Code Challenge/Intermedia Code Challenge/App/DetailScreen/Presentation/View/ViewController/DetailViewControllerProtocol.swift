//
//  DetailViewControllerProtocol.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 19/12/2020.
//

protocol DetailViewControllerProtocol: BaseViewControllerProtocol {
    func setupView(_ hero: HeroModel, _ comics: [ComicsModel])
}
