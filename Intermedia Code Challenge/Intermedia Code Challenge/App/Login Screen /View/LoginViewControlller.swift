//
//  LoginViewControlller.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import UIKit
import PureLayout

class LoginViewController: BaseViewController {

    var customView: LoginView?

    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    private func setView() {
        self.customView = LoginView()
        guard let strongCustomView = customView else { return }
        strongCustomView.delegate = self

        view.addSubview(strongCustomView)
        customView?.autoPinEdgesToSuperviewEdges()
    }
}

extension LoginViewController: LoginViewProtocol {
    func accessButtonTapped() {
        customView?.accessButton.shake()
    }

    func registerButtonTapped() {
        let presenter = RegistrationPresenter()
        let viewController = RegistrationViewController(with: presenter)
        pushViewController(viewController)
    }
}
