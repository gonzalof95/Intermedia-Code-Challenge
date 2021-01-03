//
//  LoginSpy.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

@testable import Intermedia_Code_Challenge

class LoginSpy: BaseViewControllerSpy, LoginViewControllerProtocol {
    var invokedSetupView = false
    var invokedSetupViewCount = 0

    func setupView() {
        invokedSetupView = true
        invokedSetupViewCount += 1
    }
}
