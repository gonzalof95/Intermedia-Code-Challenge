//
//  HeroViewControllerMock.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 03/01/2021.
//

@testable import Intermedia_Code_Challenge

class HeroViewControllerMock: HeroViewControllerProtocol {
    var invokedSetupView = false
    var invokedSetupViewCount = 0
    var invokedSetupViewParameters: (heroes: [HeroModel], Void)?
    var invokedSetupViewParametersList = [(heroes: [HeroModel], Void)]()

    func setupView(_ heroes: [HeroModel]) {
        invokedSetupView = true
        invokedSetupViewCount += 1
        invokedSetupViewParameters = (heroes, ())
        invokedSetupViewParametersList.append((heroes, ()))
    }

    var invokedReloadTable = false
    var invokedReloadTableCount = 0
    var invokedReloadTableParameters: (heroes: [HeroModel], Void)?
    var invokedReloadTableParametersList = [(heroes: [HeroModel], Void)]()

    func reloadTable(_ heroes: [HeroModel]) {
        invokedReloadTable = true
        invokedReloadTableCount += 1
        invokedReloadTableParameters = (heroes, ())
        invokedReloadTableParametersList.append((heroes, ()))
    }

    var invokedPushNextViewController = false
    var invokedPushNextViewControllerCount = 0
    var invokedPushNextViewControllerParameters: (viewController: BaseViewController, Void)?
    var invokedPushNextViewControllerParametersList = [(viewController: BaseViewController, Void)]()

    func pushNextViewController(_ viewController: BaseViewController) {
        invokedPushNextViewController = true
        invokedPushNextViewControllerCount += 1
        invokedPushNextViewControllerParameters = (viewController, ())
        invokedPushNextViewControllerParametersList.append((viewController, ()))
    }

    var invokedShowError = false
    var invokedShowErrorCount = 0
    var invokedShowErrorParameters: (message: String, Void)?
    var invokedShowErrorParametersList = [(message: String, Void)]()

    func showError(message: String) {
        invokedShowError = true
        invokedShowErrorCount += 1
        invokedShowErrorParameters = (message, ())
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
