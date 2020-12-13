//
//  BaseViewController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

import UIKit
import PureLayout

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
    }

    func setNavBar(_ color: UIColor) {
        navigationController?.navigationBar.backgroundColor = color
        navigationController?.navigationBar.barTintColor = color
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: Constants.mainFont, size: 20)]
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.hidesBackButton = true
        navigationItem.title = Constants.mainScreenTitle
    }

    func setStatusBar(_ color: UIColor) {
        let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)

        statusBar.backgroundColor = color
        statusBar.translatesAutoresizingMaskIntoConstraints = false
        statusBar.autoresizingMask = .flexibleWidth
        statusBar.autoresizingMask = .flexibleTopMargin

        UIApplication.shared.keyWindow?.addSubview(statusBar)
    }
}

extension BaseViewController: BaseViewControllerProtocol {
    func pushNextViewController(_ viewController: BaseViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showError(message: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Accept", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

    func presentMainScreen() {
        let tabBarController = UITabBarController()

        let heroPresenter = HeroPresenter()
        let heroViewController = HeroViewController(with: heroPresenter)

        let factsViewController = FactsViewController()

        let heroNavigationController = UINavigationController(rootViewController: heroViewController)
        let factsNavigationController = UINavigationController(rootViewController: factsViewController)

        tabBarController.setViewControllers([heroNavigationController, factsNavigationController], animated: false)
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
    }
}
