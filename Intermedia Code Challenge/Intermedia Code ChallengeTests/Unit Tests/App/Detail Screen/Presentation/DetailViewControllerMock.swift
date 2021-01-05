//
//  DetailViewControllerMock.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

@testable import Intermedia_Code_Challenge

class DetailViewControllerMock: DetailViewControllerProtocol {
    var invokedSetupView = false
    var invokedSetupViewCount = 0
    var invokedSetupViewParameters: (hero: HeroModel, comics: [ComicsModel])?
    var invokedSetupViewParametersList = [(hero: HeroModel, comics: [ComicsModel])]()

    func setupView(_ hero: HeroModel, _ comics: [ComicsModel]) {
        invokedSetupView = true
        invokedSetupViewCount += 1
        invokedSetupViewParameters = (hero, comics)
        invokedSetupViewParametersList.append((hero, comics))
    }

    var invokedReloadTable = false
    var invokedReloadTableCount = 0
    var invokedReloadTableParameters: (comics: [ComicsModel], Void)?
    var invokedReloadTableParametersList = [(comics: [ComicsModel], Void)]()

    func reloadTable(_ comics: [ComicsModel]) {
        invokedReloadTable = true
        invokedReloadTableCount += 1
        invokedReloadTableParameters = (comics, ())
        invokedReloadTableParametersList.append((comics, ()))
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
