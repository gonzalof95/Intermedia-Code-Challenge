//
//  LoginViewControlller.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import UIKit
import PureLayout

protocol LoginViewControllerProtocol: AnyObject {
    func pushNextViewController()
    func showError()
}

class LoginViewController: BaseViewController {

    var customView: LoginView?
    var presenter: LoginPresenter?

    init(with presenter: LoginPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

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
        if let email = customView?.firebaseView?.mailTextField.text,
           let password = customView?.firebaseView?.passwordTextField.text {
            presenter?.autenticateUser(email: email, password: password)
        }
    }

    func registerButtonTapped() {
        presenter?.registerButtonTapped()
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    func pushNextViewController() {
        let viewController = MainViewController()
        pushViewController(viewController)
    }

    func showError() {
        showAlert(message: "Could not log the user.")
    }
}
