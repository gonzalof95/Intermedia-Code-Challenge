//
//  BaseViewControllerProtocol.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

protocol BaseViewControllerProtocol: AnyObject {
    func pushNextViewController(_ viewController: BaseViewController)
    func showError(message: String)
    func presentMainScreen()
}

