//
//  BaseViewControllerSpy.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 02/01/2021.
//

@testable import Intermedia_Code_Challenge

class BaseViewControllerSpy: BaseViewControllerProtocol {

    var invokedPushNextViewController = false
    var invokedPushNextViewControllerCount = 0
    var invokedPushNextViewControllerParameters: BaseViewController?
    var invokedPushNextViewControllerParametersList = [(viewController: BaseViewController, Void)]()

    func pushNextViewController(_ viewController: BaseViewController) {
        invokedPushNextViewController = true
        invokedPushNextViewControllerCount += 1
        invokedPushNextViewControllerParameters = viewController
        invokedPushNextViewControllerParametersList.append((viewController, ()))
    }

    var invokedShowError = false
    var invokedShowErrorCount = 0
    var invokedShowErrorParameters: String?
    var invokedShowErrorParametersList = [(message: String, Void)]()

    func showError(message: String) {
        invokedShowError = true
        invokedShowErrorCount += 1
        invokedShowErrorParameters = message
        invokedShowErrorParametersList.append((message, ()))
    }

    var invokedPresentMainScreen = false
    var invokedPresentMainScreenCount = 0

    func presentMainScreen() {
        invokedPresentMainScreen = true
        invokedPresentMainScreenCount += 1
    }

    var invokedShowAnimation = false
    var invokedShowAnimationCount = 0

    func showAnimation() {
        invokedShowAnimation = true
        invokedShowAnimationCount += 1
    }

    var invokedHideAnimation = false
    var invokedHideAnimationCount = 0

    func hideAnimation() {
        invokedHideAnimation = true
        invokedHideAnimationCount += 1
    }
}
