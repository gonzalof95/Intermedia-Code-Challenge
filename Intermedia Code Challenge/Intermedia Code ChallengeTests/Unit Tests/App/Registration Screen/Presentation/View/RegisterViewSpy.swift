//
//  RegisterViewSpy.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

@testable import Intermedia_Code_Challenge

final class RegisterViewSpy: RegisterViewProtocol {

    var invokedRegisterButtonTapped = false
    var invokedRegisterButtonTappedCount = 0

    func registerButtonTapped() {
        invokedRegisterButtonTapped = true
        invokedRegisterButtonTappedCount += 1
    }
}
