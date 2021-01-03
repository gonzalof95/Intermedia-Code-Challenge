//
//  LoginViewSpy.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

@testable import Intermedia_Code_Challenge

class LoginViewSpy: LoginViewProtocol {
    var invokedAccessButtonTapped = false
    var invokedAccessButtonTappedCount = 0

    func accessButtonTapped() {
        invokedAccessButtonTapped = true
        invokedAccessButtonTappedCount += 1
    }

    var invokedRegisterButtonTapped = false
    var invokedRegisterButtonTappedCount = 0

    func registerButtonTapped() {
        invokedRegisterButtonTapped = true
        invokedRegisterButtonTappedCount += 1
    }
}
